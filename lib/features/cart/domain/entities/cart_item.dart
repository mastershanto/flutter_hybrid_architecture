import 'package:equatable/equatable.dart';

class CartItem extends Equatable {
  final String id;
  final String productId;
  final String name;
  final double price;
  final int quantity;
  final String imageUrl;
  final String vendorId;

  const CartItem({
    required this.id,
    required this.productId,
    required this.name,
    required this.price,
    required this.quantity,
    required this.imageUrl,
    required this.vendorId,
  });

  @override
  List<Object?> get props => [
    id,
    productId,
    name,
    price,
    quantity,
    imageUrl,
    vendorId,
  ];
}
