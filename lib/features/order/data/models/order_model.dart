import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/order.dart';

part 'order_model.g.dart';

@JsonSerializable()
class OrderModel {
  final String id;
  final String userId;
  final List<String> productIds;
  final double totalAmount;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;

  const OrderModel({
    required this.id,
    required this.userId,
    required this.productIds,
    required this.totalAmount,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);
  Map<String, dynamic> toJson() => _$OrderModelToJson(this);

  Order toEntity() => Order(
    id: id,
    userId: userId,
    productIds: productIds,
    totalAmount: totalAmount,
    status: status,
    createdAt: createdAt,
    updatedAt: updatedAt,
  );

  static OrderModel fromEntity(Order order) => OrderModel(
    id: order.id,
    userId: order.userId,
    productIds: order.productIds,
    totalAmount: order.totalAmount,
    status: order.status,
    createdAt: order.createdAt,
    updatedAt: order.updatedAt,
  );
}
