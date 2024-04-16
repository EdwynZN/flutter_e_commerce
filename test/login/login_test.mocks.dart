// Mocks generated by Mockito 5.4.4 from annotations
// in flutter_e_commerce/test/login/login_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i7;

import 'package:dio/dio.dart' as _i9;
import 'package:flutter_e_commerce/features/authentication/domain/model/credential.dart'
    as _i8;
import 'package:flutter_e_commerce/features/authentication/domain/model/oauth.dart'
    as _i2;
import 'package:flutter_e_commerce/features/authentication/domain/model/user.dart'
    as _i3;
import 'package:flutter_e_commerce/features/authentication/domain/model/user_info.dart'
    as _i11;
import 'package:flutter_e_commerce/features/authentication/domain/service/auth_local_repository.dart'
    as _i14;
import 'package:flutter_e_commerce/features/authentication/infrastructure/data/platzi_auth_api.dart'
    as _i6;
import 'package:flutter_e_commerce/features/authentication/infrastructure/data/platzi_user_api.dart'
    as _i10;
import 'package:flutter_e_commerce/features/authentication/infrastructure/model/user_available.dart'
    as _i4;
import 'package:flutter_e_commerce/features/cart/domain/model/cart.dart' as _i5;
import 'package:flutter_e_commerce/features/cart/domain/service/cart_repository.dart'
    as _i15;
import 'package:flutter_e_commerce/features/products/domain/model/product.dart'
    as _i13;
import 'package:flutter_e_commerce/features/products/infrastructure/data/platzi_product_api.dart'
    as _i12;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeOAuth_0 extends _i1.SmartFake implements _i2.OAuth {
  _FakeOAuth_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeUser_1 extends _i1.SmartFake implements _i3.User {
  _FakeUser_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeUserAvailable_2 extends _i1.SmartFake implements _i4.UserAvailable {
  _FakeUserAvailable_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeCart_3 extends _i1.SmartFake implements _i5.Cart {
  _FakeCart_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [PlatziAuthApi].
///
/// See the documentation for Mockito's code generation for more information.
class MockPlatziAuthApi extends _i1.Mock implements _i6.PlatziAuthApi {
  @override
  _i7.Future<_i2.OAuth> login({
    required _i8.Credential? credential,
    _i9.CancelToken? cancelToken,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #login,
          [],
          {
            #credential: credential,
            #cancelToken: cancelToken,
          },
        ),
        returnValue: _i7.Future<_i2.OAuth>.value(_FakeOAuth_0(
          this,
          Invocation.method(
            #login,
            [],
            {
              #credential: credential,
              #cancelToken: cancelToken,
            },
          ),
        )),
        returnValueForMissingStub: _i7.Future<_i2.OAuth>.value(_FakeOAuth_0(
          this,
          Invocation.method(
            #login,
            [],
            {
              #credential: credential,
              #cancelToken: cancelToken,
            },
          ),
        )),
      ) as _i7.Future<_i2.OAuth>);

  @override
  _i7.Future<_i2.OAuth> refresh({
    required Map<String, dynamic>? refresh,
    _i9.CancelToken? cancelToken,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #refresh,
          [],
          {
            #refresh: refresh,
            #cancelToken: cancelToken,
          },
        ),
        returnValue: _i7.Future<_i2.OAuth>.value(_FakeOAuth_0(
          this,
          Invocation.method(
            #refresh,
            [],
            {
              #refresh: refresh,
              #cancelToken: cancelToken,
            },
          ),
        )),
        returnValueForMissingStub: _i7.Future<_i2.OAuth>.value(_FakeOAuth_0(
          this,
          Invocation.method(
            #refresh,
            [],
            {
              #refresh: refresh,
              #cancelToken: cancelToken,
            },
          ),
        )),
      ) as _i7.Future<_i2.OAuth>);

  @override
  _i7.Future<_i3.User> getUserInfo({
    required String? authToken,
    _i9.CancelToken? cancelToken,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #getUserInfo,
          [],
          {
            #authToken: authToken,
            #cancelToken: cancelToken,
          },
        ),
        returnValue: _i7.Future<_i3.User>.value(_FakeUser_1(
          this,
          Invocation.method(
            #getUserInfo,
            [],
            {
              #authToken: authToken,
              #cancelToken: cancelToken,
            },
          ),
        )),
        returnValueForMissingStub: _i7.Future<_i3.User>.value(_FakeUser_1(
          this,
          Invocation.method(
            #getUserInfo,
            [],
            {
              #authToken: authToken,
              #cancelToken: cancelToken,
            },
          ),
        )),
      ) as _i7.Future<_i3.User>);
}

/// A class which mocks [PlatziUserApi].
///
/// See the documentation for Mockito's code generation for more information.
class MockPlatziUserApi extends _i1.Mock implements _i10.PlatziUserApi {
  @override
  _i7.Future<_i4.UserAvailable> checkAvailability({
    required Map<String, dynamic>? email,
    _i9.CancelToken? cancelToken,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #checkAvailability,
          [],
          {
            #email: email,
            #cancelToken: cancelToken,
          },
        ),
        returnValue: _i7.Future<_i4.UserAvailable>.value(_FakeUserAvailable_2(
          this,
          Invocation.method(
            #checkAvailability,
            [],
            {
              #email: email,
              #cancelToken: cancelToken,
            },
          ),
        )),
        returnValueForMissingStub:
            _i7.Future<_i4.UserAvailable>.value(_FakeUserAvailable_2(
          this,
          Invocation.method(
            #checkAvailability,
            [],
            {
              #email: email,
              #cancelToken: cancelToken,
            },
          ),
        )),
      ) as _i7.Future<_i4.UserAvailable>);

  @override
  _i7.Future<_i3.User> createUser({
    required _i11.UserInfo? newUserInfo,
    _i9.CancelToken? cancelToken,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #createUser,
          [],
          {
            #newUserInfo: newUserInfo,
            #cancelToken: cancelToken,
          },
        ),
        returnValue: _i7.Future<_i3.User>.value(_FakeUser_1(
          this,
          Invocation.method(
            #createUser,
            [],
            {
              #newUserInfo: newUserInfo,
              #cancelToken: cancelToken,
            },
          ),
        )),
        returnValueForMissingStub: _i7.Future<_i3.User>.value(_FakeUser_1(
          this,
          Invocation.method(
            #createUser,
            [],
            {
              #newUserInfo: newUserInfo,
              #cancelToken: cancelToken,
            },
          ),
        )),
      ) as _i7.Future<_i3.User>);
}

/// A class which mocks [PlatziProductsApi].
///
/// See the documentation for Mockito's code generation for more information.
class MockPlatziProductsApi extends _i1.Mock implements _i12.PlatziProductsApi {
  @override
  _i7.Future<List<_i13.Product>> getProducts({
    String? title,
    int? offset,
    int? limit,
    int? minParice,
    int? maxParice,
    _i9.CancelToken? cancelToken,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #getProducts,
          [],
          {
            #title: title,
            #offset: offset,
            #limit: limit,
            #minParice: minParice,
            #maxParice: maxParice,
            #cancelToken: cancelToken,
          },
        ),
        returnValue: _i7.Future<List<_i13.Product>>.value(<_i13.Product>[]),
        returnValueForMissingStub:
            _i7.Future<List<_i13.Product>>.value(<_i13.Product>[]),
      ) as _i7.Future<List<_i13.Product>>);

  @override
  _i7.Future<_i13.Product?> product({
    required int? id,
    _i9.CancelToken? cancelToken,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #product,
          [],
          {
            #id: id,
            #cancelToken: cancelToken,
          },
        ),
        returnValue: _i7.Future<_i13.Product?>.value(),
        returnValueForMissingStub: _i7.Future<_i13.Product?>.value(),
      ) as _i7.Future<_i13.Product?>);
}

/// A class which mocks [AuthenticationLocalStorage].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthenticationLocalStorage<T extends _i3.UserCredential>
    extends _i1.Mock implements _i14.AuthenticationLocalStorage<T> {
  @override
  _i7.Future<T?> read() => (super.noSuchMethod(
        Invocation.method(
          #read,
          [],
        ),
        returnValue: _i7.Future<T?>.value(),
        returnValueForMissingStub: _i7.Future<T?>.value(),
      ) as _i7.Future<T?>);

  @override
  _i7.Future<void> write(T? token) => (super.noSuchMethod(
        Invocation.method(
          #write,
          [token],
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);

  @override
  _i7.Future<void> delete() => (super.noSuchMethod(
        Invocation.method(
          #delete,
          [],
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);
}

/// A class which mocks [CartRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockCartRepository extends _i1.Mock implements _i15.CartRepository {
  @override
  _i7.Future<_i5.Cart> getAll() => (super.noSuchMethod(
        Invocation.method(
          #getAll,
          [],
        ),
        returnValue: _i7.Future<_i5.Cart>.value(_FakeCart_3(
          this,
          Invocation.method(
            #getAll,
            [],
          ),
        )),
        returnValueForMissingStub: _i7.Future<_i5.Cart>.value(_FakeCart_3(
          this,
          Invocation.method(
            #getAll,
            [],
          ),
        )),
      ) as _i7.Future<_i5.Cart>);

  @override
  _i7.Future<_i5.Cart> addItem(_i5.PurchasedItem? item) => (super.noSuchMethod(
        Invocation.method(
          #addItem,
          [item],
        ),
        returnValue: _i7.Future<_i5.Cart>.value(_FakeCart_3(
          this,
          Invocation.method(
            #addItem,
            [item],
          ),
        )),
        returnValueForMissingStub: _i7.Future<_i5.Cart>.value(_FakeCart_3(
          this,
          Invocation.method(
            #addItem,
            [item],
          ),
        )),
      ) as _i7.Future<_i5.Cart>);

  @override
  _i7.Future<_i5.Cart> updatePrice({
    required int? id,
    required double? price,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #updatePrice,
          [],
          {
            #id: id,
            #price: price,
          },
        ),
        returnValue: _i7.Future<_i5.Cart>.value(_FakeCart_3(
          this,
          Invocation.method(
            #updatePrice,
            [],
            {
              #id: id,
              #price: price,
            },
          ),
        )),
        returnValueForMissingStub: _i7.Future<_i5.Cart>.value(_FakeCart_3(
          this,
          Invocation.method(
            #updatePrice,
            [],
            {
              #id: id,
              #price: price,
            },
          ),
        )),
      ) as _i7.Future<_i5.Cart>);

  @override
  _i7.Future<_i5.Cart> updateQuantity({
    required int? id,
    required int? quantity,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateQuantity,
          [],
          {
            #id: id,
            #quantity: quantity,
          },
        ),
        returnValue: _i7.Future<_i5.Cart>.value(_FakeCart_3(
          this,
          Invocation.method(
            #updateQuantity,
            [],
            {
              #id: id,
              #quantity: quantity,
            },
          ),
        )),
        returnValueForMissingStub: _i7.Future<_i5.Cart>.value(_FakeCart_3(
          this,
          Invocation.method(
            #updateQuantity,
            [],
            {
              #id: id,
              #quantity: quantity,
            },
          ),
        )),
      ) as _i7.Future<_i5.Cart>);

  @override
  _i7.Future<_i5.Cart> deleteItem(int? id) => (super.noSuchMethod(
        Invocation.method(
          #deleteItem,
          [id],
        ),
        returnValue: _i7.Future<_i5.Cart>.value(_FakeCart_3(
          this,
          Invocation.method(
            #deleteItem,
            [id],
          ),
        )),
        returnValueForMissingStub: _i7.Future<_i5.Cart>.value(_FakeCart_3(
          this,
          Invocation.method(
            #deleteItem,
            [id],
          ),
        )),
      ) as _i7.Future<_i5.Cart>);

  @override
  _i7.Future<_i5.Cart> deleteAll() => (super.noSuchMethod(
        Invocation.method(
          #deleteAll,
          [],
        ),
        returnValue: _i7.Future<_i5.Cart>.value(_FakeCart_3(
          this,
          Invocation.method(
            #deleteAll,
            [],
          ),
        )),
        returnValueForMissingStub: _i7.Future<_i5.Cart>.value(_FakeCart_3(
          this,
          Invocation.method(
            #deleteAll,
            [],
          ),
        )),
      ) as _i7.Future<_i5.Cart>);
}