import 'package:equatable/equatable.dart';

class Order extends Equatable {
  final String id;
  final String userId;
  final List<String> productIds;
  final double totalAmount;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Order({
    required this.id,
    required this.userId,
    required this.productIds,
    required this.totalAmount,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [
    id,
    userId,
    productIds,
    totalAmount,
    status,
    createdAt,
    updatedAt,
  ];
}
