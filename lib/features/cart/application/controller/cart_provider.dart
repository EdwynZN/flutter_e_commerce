import 'package:flutter_e_commerce/features/cart/domain/implementation/hive_cart_repository.dart';
import 'package:flutter_e_commerce/features/cart/domain/model/cart.dart';
import 'package:flutter_e_commerce/features/cart/domain/service/cart_repository.dart';
import 'package:flutter_e_commerce/features/products/domain/model/product.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cart_provider.g.dart';

@riverpod
class CartController extends AutoDisposeAsyncNotifier<Cart> {
  @override
  Future<Cart> build() async {
    final repository = ref.watch(cartRepositoryProvider);
    final result = await repository.getAll();
    return result;
  }

  CartRepository get _repository => ref.read(cartRepositoryProvider);

  Future<void> clearCart() async {
    if (state.isLoading) {
      return;
    }
    state = const AsyncLoading<Cart>().copyWithPrevious(state);
    final newCart = await AsyncValue.guard(_repository.deleteAll);
    state = newCart.copyWithPrevious(state);
  }

  Future<void> addProduct({
    required Product product,
    required int quantity,
  }) async {
    if (state.isLoading) {
      return;
    }
    state = const AsyncLoading<Cart>().copyWithPrevious(state);
    final item = PurchasedItem(
      id: 0,
      price: product.price,
      quantity: quantity,
      product: ItemProduct(id: product.id, name: product.title),
    );
    final newCart = await AsyncValue.guard(() async {
      return _repository.addItem(item);
    });
    state = newCart.copyWithPrevious(state);
  }

  Future<void> removeItem({
    required int id,
  }) async {
    if (state.isLoading) {
      return;
    }
    state = const AsyncLoading<Cart>().copyWithPrevious(state);
    final newCart = await AsyncValue.guard(() async {
      return _repository.deleteItem(id);
    });
    state = newCart.copyWithPrevious(state);
  }

  Future<void> changeQuantity({
    required int purchaseId,
    required int quantity,
  }) async {
    if (state.isLoading) {
      return;
    }
    state = const AsyncLoading<Cart>().copyWithPrevious(state);
    final newCart = await AsyncValue.guard(() async {
      return _repository.updateQuantity(
        id: purchaseId,
        quantity: quantity,
      );
    });
    state = newCart.copyWithPrevious(state);
  }
}
