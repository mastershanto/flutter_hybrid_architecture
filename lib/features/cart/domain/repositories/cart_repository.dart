import '../entities/cart_item.dart';

abstract class CartRepository {
  Future<List<CartItem>> getCartItems();
  Future<void> addToCart(CartItem item);
  Future<void> updateCartItem(CartItem item);
  Future<void> removeFromCart(String id);
  Future<void> clearCart();
}
