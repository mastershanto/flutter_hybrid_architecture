import '../entities/order.dart';

abstract class OrderRepository {
  Future<List<Order>> getOrders();
  Future<Order> getOrderById(String id);
  Future<void> placeOrder(Order order);
  Future<void> updateOrder(Order order);
  Future<void> cancelOrder(String id);
}
