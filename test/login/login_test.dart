import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/common/screen/splash.dart';
import 'package:flutter_e_commerce/common/widget/avatar_user.dart';
import 'package:flutter_e_commerce/features/authentication/application/controller/auth_provider.dart';
import 'package:flutter_e_commerce/features/authentication/application/screen/login.dart';
import 'package:flutter_e_commerce/features/authentication/domain/exception/auth_exception.dart';
import 'package:flutter_e_commerce/features/authentication/domain/implementation/auth_repository.dart';
import 'package:flutter_e_commerce/features/authentication/domain/implementation/memory_local_storage.dart';
import 'package:flutter_e_commerce/features/authentication/domain/implementation/user_repository.dart';
import 'package:flutter_e_commerce/features/authentication/domain/model/credential.dart';
import 'package:flutter_e_commerce/features/authentication/domain/model/oauth.dart';
import 'package:flutter_e_commerce/features/authentication/domain/model/session.dart';
import 'package:flutter_e_commerce/features/authentication/domain/model/user.dart';
import 'package:flutter_e_commerce/features/authentication/domain/service/auth_local_repository.dart';
import 'package:flutter_e_commerce/features/authentication/infrastructure/data/platzi_auth_api.dart';
import 'package:flutter_e_commerce/features/authentication/infrastructure/data/platzi_user_api.dart';
import 'package:flutter_e_commerce/features/cart/domain/implementation/hive_cart_repository.dart';
import 'package:flutter_e_commerce/features/cart/domain/model/cart.dart';
import 'package:flutter_e_commerce/features/cart/domain/service/cart_repository.dart';
import 'package:flutter_e_commerce/features/products/application/screen/products_list_screen.dart';
import 'package:flutter_e_commerce/features/products/infrastructure/data/platzi_product_api.dart';
import 'package:flutter_e_commerce/main.dart';
import 'package:flutter_e_commerce/shared/platzi_api_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'login_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<PlatziAuthApi>(),
  MockSpec<PlatziUserApi>(),
  MockSpec<PlatziProductsApi>(),
  MockSpec<AuthenticationLocalStorage>(),
  MockSpec<CartRepository>(),
])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  /// business logic of login
  group(
    'test auth controller logic: ',
    () {
      late MockPlatziAuthApi authApi;
      late MockPlatziUserApi userApi;
      late ProviderContainer container;

      setUp(() async {
        authApi = MockPlatziAuthApi();
        userApi = MockPlatziUserApi();
      });

      tearDown(() {
        container.dispose();
      });

      test('initial session exists', () async {
        const accessToken = 'access_token';

        /// implementation to test save, delete and retrieval of credentials
        final AuthenticationLocalStorage localApi = MemAuthenticationStorage();

        const credential =
            Credential(email: 'email@mail.com', password: 'password');
        final userCredential = UserCredential(
          oAuth: OAuth(
            accessToken: accessToken,
            refreshToken: 'bearer_token',
          ),
          credential: credential,
        );

        await localApi.write(userCredential);

        container = ProviderContainer(
          overrides: [
            platziAuthApiProvider.overrideWithValue(authApi),
            platziUserApiProvider.overrideWithValue(userApi),
            credentialLocalStorageProvider.overrideWithValue(localApi),
          ],
        );

        /// mock user info http request
        const user = User(id: 1, name: 'Mario', email: 'email@mail.com');
        when(authApi.getUserInfo(authToken: anyNamed('authToken'))).thenAnswer(
          (_) => Future.delayed(
            const Duration(seconds: 1),
            () => user,
          ),
        );

        /// keeps the provider alive
        final authSubscription = container.listen<AsyncValue<Session>>(
          authServiceProvider,
          (prev, curr) {},
          fireImmediately: true,
        );

        expect(
          container.read(authServiceProvider),
          isA<AsyncLoading<Session>>(),
        );

        await untilCalled(
          authApi.getUserInfo(
            authToken: captureAnyNamed('authToken'),
            cancelToken: argThat(isNull, named: 'cancelToken'),
          ),
        );

        verify(authApi.getUserInfo(
          authToken: anyNamed('authToken'),
          cancelToken: argThat(isNull, named: 'cancelToken'),
        )).called(1);

        await expectLater(
          container.read(authServiceProvider.future),
          completion(
            isA<OAuthSession>()
                .having(
                  (p0) => p0.credential,
                  'login credentials',
                  equals(credential),
                )
                .having((p0) => p0.userInfo, 'user info', equals(user))
                .having(
                  (p0) => p0.oAuth,
                  'oauth',
                  equals(userCredential.oAuth),
                ),
          ),
        );

        /// Test logout

        await container.read(authServiceProvider.notifier).logout();
        await expectLater(
          localApi.read(),
          completion(
            isA<UserCredential>().having((p0) => p0.oAuth, 'no token', isNull),
          ),
        );

        expect(
          container.read(authServiceProvider),
          isA<AsyncData<Session>>().having(
            (p0) => p0.value,
            'no session type',
            isA<NoSession>()
                .having((p0) => p0.credential, 'remain credential', isNotNull),
          ),
        );

        authSubscription.close();
      });

      test('previous credential exists', () async {
        /// implementation to test save, delete and retrieval of credentials
        final AuthenticationLocalStorage localApi = MemAuthenticationStorage();

        const credential =
            Credential(email: 'email@mail.com', password: 'password');
        const userCredential = UserCredential(credential: credential);

        await localApi.write(userCredential);

        container = ProviderContainer(
          overrides: [
            platziAuthApiProvider.overrideWithValue(authApi),
            platziUserApiProvider.overrideWithValue(userApi),
            credentialLocalStorageProvider.overrideWithValue(localApi),
          ],
        );

        const user = User(id: 1, name: 'Mario', email: 'email@mail.com');
        when(authApi.getUserInfo(authToken: anyNamed('authToken'))).thenAnswer(
          (_) => Future.delayed(
            const Duration(seconds: 1),
            () => user,
          ),
        );

        /// keeps the provider alive
        final authSubscription = container.listen<AsyncValue<Session>>(
          authServiceProvider,
          (prev, curr) {},
          fireImmediately: true,
        );

        expect(
          container.read(authServiceProvider),
          isA<AsyncLoading<Session>>(),
        );

        verifyNever(authApi.getUserInfo(
          authToken: anyNamed('authToken'),
          cancelToken: argThat(isNull, named: 'cancelToken'),
        ));

        await expectLater(
          localApi.read(),
          completion(
            isA<UserCredential>().having((p0) => p0.oAuth, 'no token', isNull),
          ),
        );
        await expectLater(
          container.read(authServiceProvider.future),
          completion(
            isA<NoSession>().having(
              (p0) => p0.credential,
              'login credentials',
              equals(credential),
            ),
          ),
        );

        const accessToken = 'new_token';
        final oAuth = OAuth(
          accessToken: accessToken,
          refreshToken: 'bearer_token',
        );

        /// mock login http request
        when(authApi.login(credential: credential)).thenAnswer(
          (_) => Future.delayed(
            const Duration(seconds: 1),
            () => oAuth,
          ),
        );

        await container.read(authServiceProvider.notifier).loginWithCredential(
              credential,
            );
        await untilCalled(
          authApi.login(
            credential: anyNamed('credential'),
            cancelToken: argThat(isNull, named: 'cancelToken'),
          ),
        );

        verify(authApi.getUserInfo(
          authToken: anyNamed('authToken'),
          cancelToken: argThat(isNull, named: 'cancelToken'),
        )).called(1);

        verify(authApi.login(
          credential: anyNamed('credential'),
          cancelToken: argThat(isNull, named: 'cancelToken'),
        )).called(1);

        await expectLater(
          container.read(authServiceProvider.future),
          completion(
            isA<OAuthSession>()
                .having(
                  (p0) => p0.credential,
                  'login credentials',
                  equals(credential),
                )
                .having((p0) => p0.userInfo, 'user info', equals(user))
                .having(
                  (p0) => p0.oAuth,
                  'oauth',
                  equals(oAuth),
                ),
          ),
        );

        authSubscription.close();
      });

      test('wrong credential', () async {
        /// implementation to test save, delete and retrieval of credentials
        final AuthenticationLocalStorage localApi = MemAuthenticationStorage();

        container = ProviderContainer(
          overrides: [
            platziAuthApiProvider.overrideWithValue(authApi),
            platziUserApiProvider.overrideWithValue(userApi),
            credentialLocalStorageProvider.overrideWithValue(localApi),
          ],
        );

        /// keeps the provider alive
        final authSubscription = container.listen<AsyncValue<Session>>(
          authServiceProvider,
          (prev, curr) {},
          fireImmediately: true,
        );

        expect(
          container.read(authServiceProvider),
          isA<AsyncLoading<Session>>(),
        );

        await expectLater(
          container.read(authServiceProvider.future),
          completion(
            isA<NoSession>().having(
              (p0) => p0.credential,
              'login credentials',
              isNull,
            ),
          ),
        );

        Credential credential = const Credential(
            email: 'email@mail.com', password: 'wrong_password');
        when(authApi.login(credential: credential)).thenThrow(
          const EmailCredentialFailure(message: 'invalid credentials'),
        );

        await container.read(authServiceProvider.notifier).loginWithCredential(
              credential,
            );

        expect(
          container.read(authServiceProvider),
          isA<AsyncError<Session>>().having(
            (p0) => p0.error,
            'invalid credential failure',
            isA<EmailCredentialFailure>(),
          ),
        );

        /// reset and try with correct credentials

        reset(authApi);
        const accessToken = 'new_token';
        final oAuth = OAuth(
          accessToken: accessToken,
          refreshToken: 'bearer_token',
        );
        credential = const Credential(
          email: 'email@mail.com',
          password: 'password',
        );

        const user = User(id: 1, name: 'Mario', email: 'email@mail.com');
        when(authApi.getUserInfo(authToken: anyNamed('authToken'))).thenAnswer(
          (_) => Future.delayed(
            const Duration(seconds: 1),
            () => user,
          ),
        );

        when(authApi.login(credential: credential)).thenAnswer(
          (_) => Future.delayed(
            const Duration(seconds: 1),
            () => oAuth,
          ),
        );

        await container.read(authServiceProvider.notifier).loginWithCredential(
              credential,
            );
        await untilCalled(
          authApi.login(
            credential: anyNamed('credential'),
            cancelToken: argThat(isNull, named: 'cancelToken'),
          ),
        );

        await expectLater(
          container.read(authServiceProvider.future),
          completion(
            isA<OAuthSession>()
                .having(
                  (p0) => p0.credential,
                  'login credentials',
                  equals(credential),
                )
                .having((p0) => p0.userInfo, 'user info', equals(user))
                .having(
                  (p0) => p0.oAuth,
                  'oauth',
                  equals(oAuth),
                ),
          ),
        );

        /// Just once because the reset
        verify(authApi.login(
          credential: anyNamed('credential'),
          cancelToken: argThat(isNull, named: 'cancelToken'),
        )).called(1);

        authSubscription.close();
      });
    },
  );

  group(
    'test auth screen: ',
    () {
      late MockPlatziAuthApi authApi;
      late MockPlatziUserApi userApi;
      late MockPlatziProductsApi platziProductApi;
      late MockCartRepository cartRepository;
      late ProviderContainer container;

      setUpAll(() {
        WidgetsFlutterBinding.ensureInitialized();
      });

      setUp(() async {
        authApi = MockPlatziAuthApi();
        userApi = MockPlatziUserApi();
        platziProductApi = MockPlatziProductsApi();
        cartRepository = MockCartRepository();
      });

      tearDown(() {
        container.dispose();
      });

      testWidgets('initial session exists', (WidgetTester tester) async {
        tester.view.physicalSize = const Size(411, 720);
        tester.view.devicePixelRatio = 1;

        const accessToken = 'access_token';

        /// implementation to test save, delete and retrieval of credentials
        final AuthenticationLocalStorage localApi = MemAuthenticationStorage();

        const credential =
            Credential(email: 'email@mail.com', password: 'password');
        final userCredential = UserCredential(
          oAuth: OAuth(
            accessToken: accessToken,
            refreshToken: 'bearer_token',
          ),
          credential: credential,
        );

        const user = User(id: 1, name: 'Mario', email: 'email@mail.com');
        when(authApi.getUserInfo(authToken: anyNamed('authToken'))).thenAnswer(
          (_) async => user,
        );

        when(platziProductApi.getProducts(
          offset: argThat(isZero, named: 'offset'),
          limit: anyNamed('limit'),
        )).thenAnswer(
          (_) => Future.delayed(
            const Duration(seconds: 1),
            () => const [],
          ),
        );

        when(cartRepository.getAll()).thenAnswer(
          (_) => Future.delayed(
            const Duration(seconds: 1),
            () => Cart(items: const []),
          ),
        );

        /// initial data
        /// Repositories are mocked so we can actually test controller logic
        /// and routes flow
        await localApi.write(userCredential);
        container = ProviderContainer(
          overrides: [
            platziAuthApiProvider.overrideWithValue(authApi),
            platziUserApiProvider.overrideWithValue(userApi),
            credentialLocalStorageProvider.overrideWithValue(localApi),
            cartRepositoryProvider.overrideWith((_,__) => cartRepository),
            platziApiProvider.overrideWithValue(
              PlatziApi.test(productsApi: platziProductApi),
            ),
          ],
        );

        await tester.pumpWidget(
          UncontrolledProviderScope(
            container: container,
            child: const MainApp(),
          ),
        );

        /// app starts loading the splash screen and auth provider initializes
        /// with the session saved in local
        final splash = find.byType(SplashScreen);
        expect(splash, findsOneWidget);

        await untilCalled(
          authApi.getUserInfo(
            authToken: captureAnyNamed('authToken'),
            cancelToken: argThat(isNull, named: 'cancelToken'),
          ),
        );

        verify(authApi.getUserInfo(
          authToken: anyNamed('authToken'),
          cancelToken: argThat(isNull, named: 'cancelToken'),
        )).called(1);

        await expectLater(
          container.read(authServiceProvider.future),
          completion(
            isA<OAuthSession>()
                .having(
                  (p0) => p0.credential,
                  'login credentials',
                  equals(credential),
                )
                .having((p0) => p0.userInfo, 'user info', equals(user))
                .having(
                  (p0) => p0.oAuth,
                  'oauth',
                  equals(userCredential.oAuth),
                ),
          ),
        );
        await tester.pumpAndSettle(const Duration(seconds: 1));

        /// Everything runs smooth and the app moves to home screen (Product list)
        final productScreen = find.byType(ProductListScreen);
        expect(productScreen, findsOneWidget);

        /// Test logout
        final avatarIcon = find.byType(UserAvatar);
        await tester.tap(avatarIcon);
        await tester.pumpAndSettle(const Duration(milliseconds: 400));

        final logoutButton = find.text('Logout');
        await tester.tap(logoutButton);
        await tester.pumpAndSettle(const Duration(seconds: 1));

        /// wait for the authServiceProvider.logout to finish
        await tester.runAsync(() => Future.delayed(const Duration(seconds: 1)));

        expect(
          container.read(authServiceProvider),
          isA<AsyncData<Session>>().having(
            (p0) => p0.value,
            'no session type',
            isA<NoSession>()
                .having((p0) => p0.credential, 'remain credential', isNotNull),
          ),
        );

        /// after logout the user is back to the login screen
        final loginScreen = find.byType(LoginScreen);
        expect(loginScreen, findsOneWidget);
      });

      testWidgets('previous credential exists', (WidgetTester tester) async {
        tester.view.physicalSize = const Size(411, 720);
        tester.view.devicePixelRatio = 1;

        /// implementation to test save, delete and retrieval of credentials
        final AuthenticationLocalStorage localApi = MemAuthenticationStorage();

        const credential =
            EmailAuthCredential(email: 'email@mail.com', password: 'password');
        const userCredential = UserCredential(credential: credential);

        const user = User(id: 1, name: 'Mario', email: 'email@mail.com');
        when(authApi.getUserInfo(authToken: anyNamed('authToken'))).thenAnswer(
          (_) async => user,
        );

        const accessToken = 'new_token';
        final oAuth = OAuth(
          accessToken: accessToken,
          refreshToken: 'bearer_token',
        );
        /// valid mock callback, when the credential is sent it will return the
        /// auth tokens
        when(authApi.login(
          credential: argThat(equals(credential), named: 'credential'))).thenAnswer(
          (_) async => oAuth,
        );
        /// invalid mock (wrong credentials) and will throw and exception
        when(authApi.login(
          credential: argThat(isNot(equals(credential)), named: 'credential'))
        ).thenThrow(const CredentialFailure(message: 'invalid credential'));

        when(platziProductApi.getProducts(
          offset: argThat(isZero, named: 'offset'),
          limit: anyNamed('limit'),
        )).thenAnswer(
          (_) => Future.delayed(
            const Duration(seconds: 1),
            () => const [],
          ),
        );

        when(cartRepository.getAll()).thenAnswer(
          (_) => Future.delayed(
            const Duration(seconds: 1),
            () => Cart(items: const []),
          ),
        );

        /// initial data
        /// Repositories are mocked so we can actually test controller logic
        /// and routes flow
        await localApi.write(userCredential);
        container = ProviderContainer(
          overrides: [
            platziAuthApiProvider.overrideWithValue(authApi),
            platziUserApiProvider.overrideWithValue(userApi),
            credentialLocalStorageProvider.overrideWithValue(localApi),
            cartRepositoryProvider.overrideWith((_, __) => cartRepository),
            platziApiProvider.overrideWithValue(
              PlatziApi.test(productsApi: platziProductApi),
            ),
          ],
        );

        await tester.pumpWidget(
          UncontrolledProviderScope(
            container: container,
            child: const MainApp(),
          ),
        );

        /// app starts loading the splash screen and auth provider initializes
        /// with the credentials but no auth (NoSession)
        final splash = find.byType(SplashScreen);
        expect(splash, findsOneWidget);

        /// wait for the authServiceProvider to finish
        await tester.runAsync(() => container.read(authServiceProvider.future));
        await tester.pumpAndSettle(const Duration(seconds: 1));

        /// because there is no session we should be in login
        final loginScreen = find.byType(LoginScreen);
        expect(loginScreen, findsOneWidget);

        /// Check form fields
        Finder passwordField = find.ancestor(
          of: find.text(credential.password),
          matching: find.byType(TextFormField),
        );

        /// password should be already filled because the credentials existed in local.
        /// There should be a button to change account if we want to use another email
        /// and a text with the email
        expect(passwordField, findsOneWidget);
        expect(find.text(credential.email), findsOneWidget);
        expect(find.text('Change account'), findsOneWidget);
        final loginButton = find.text('Login');

        /// changing the password should fail when login
        await tester.enterText(passwordField, "wrong_password");
        await tester.tap(loginButton);

        await untilCalled(
          authApi.login(
            credential: anyNamed('credential'),
            cancelToken: argThat(isNull, named: 'cancelToken'),
          ),
        );

        expect(
          container.read(authServiceProvider),
          isA<AsyncError<Session>>().having(
            (p0) => p0.error,
            'invalid credential failure',
            isA<EmailCredentialFailure>(),
          ),
        );

        /// using the correct password
        passwordField = find.ancestor(
          of: find.text("wrong_password"),
          matching: find.byType(TextFormField),
        );
        await tester.enterText(passwordField, credential.password);
        await tester.tap(loginButton);

        await untilCalled(
          authApi.getUserInfo(
            authToken: captureAnyNamed('authToken'),
            cancelToken: argThat(isNull, named: 'cancelToken'),
          ),
        );

        verify(authApi.getUserInfo(
          authToken: anyNamed('authToken'),
          cancelToken: argThat(isNull, named: 'cancelToken'),
        )).called(1);

        await expectLater(
          container.read(authServiceProvider.future),
          completion(
            isA<OAuthSession>()
                .having(
                  (p0) => p0.credential,
                  'login credentials',
                  equals(credential),
                )
                .having((p0) => p0.userInfo, 'user info', equals(user))
                .having(
                  (p0) => p0.oAuth,
                  'oauth',
                  equals(oAuth),
                ),
          ),
        );
        await tester.pumpAndSettle(const Duration(seconds: 1));

        /// Login is succesful and the app moves to products
        final productScreen = find.byType(ProductListScreen);
        expect(productScreen, findsOneWidget);
      });

    },
  );
}
