import 'package:dio/dio.dart';
import '../models/order_model.dart';
import 'package:todo_flutter_hybrid/core/config/api_config.dart';

class OrderRemoteDataSource {
  final Dio dio;
  OrderRemoteDataSource(this.dio);

  Future<List<OrderModel>> getOrders() async {
    final response = await dio.get(ApiConfig.orders);
    final data = response.data as List;
    return data.map((json) => OrderModel.fromJson(json)).toList();
  }

  Future<OrderModel> getOrderById(String id) async {
    final response = await dio.get('${ApiConfig.orders}/$id');
    return OrderModel.fromJson(response.data);
  }

  Future<void> placeOrder(OrderModel order) async {
    await dio.post(ApiConfig.orders, data: order.toJson());
  }

  Future<void> updateOrder(OrderModel order) async {
    await dio.put('${ApiConfig.orders}/${order.id}', data: order.toJson());
  }

  Future<void> cancelOrder(String id) async {
    await dio.delete('${ApiConfig.orders}/$id');
  }
}
