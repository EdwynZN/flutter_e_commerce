import 'package:flutter_e_commerce/features/authentication/application/controller/auth_provider.dart';
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
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'login_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<PlatziAuthApi>(),
  MockSpec<PlatziUserApi>(),
  MockSpec<AuthenticationLocalStorage>(),
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
        when(authApi.login(credential: credential.toJson())).thenAnswer(
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
        when(authApi.login(credential: credential.toJson())).thenThrow(
            const EmailCredentialFailure(message: 'invalid credentials'),
        );

        await container.read(authServiceProvider.notifier).loginWithCredential(
              credential,
            );

        expect(
          container.read(authServiceProvider),
          isA<AsyncError<Session>>()
            .having(
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

        when(authApi.login(credential: credential.toJson())).thenAnswer(
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

        when(authApi.login(credential: credential.toJson())).thenAnswer(
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
        when(authApi.login(credential: credential.toJson())).thenThrow(
            const EmailCredentialFailure(message: 'invalid credentials'),
        );

        await container.read(authServiceProvider.notifier).loginWithCredential(
              credential,
            );

        expect(
          container.read(authServiceProvider),
          isA<AsyncError<Session>>()
            .having(
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

        when(authApi.login(credential: credential.toJson())).thenAnswer(
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
}
