import 'package:dio/dio.dart';
import '../models/cart_item_model.dart';
import 'package:todo_flutter_hybrid/core/config/api_config.dart';

class CartRemoteDataSource {
  final Dio dio;
  CartRemoteDataSource(this.dio);

  Future<List<CartItemModel>> getCartItems() async {
    final response = await dio.get(ApiConfig.cart);
    final data = response.data as List;
    return data.map((json) => CartItemModel.fromJson(json)).toList();
  }

  Future<void> addToCart(CartItemModel item) async {
    await dio.post(ApiConfig.cart, data: item.toJson());
  }

  Future<void> updateCartItem(CartItemModel item) async {
    await dio.put('${ApiConfig.cart}/${item.id}', data: item.toJson());
  }

  Future<void> removeFromCart(String id) async {
    await dio.delete('${ApiConfig.cart}/$id');
  }

  Future<void> clearCart() async {
    await dio.delete(ApiConfig.cart);
  }
}
