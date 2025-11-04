import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/cart_item.dart';

part 'cart_item_model.g.dart';

@JsonSerializable()
class CartItemModel {
  final String id;
  final String productId;
  final String name;
  final double price;
  final int quantity;
  final String imageUrl;
  final String vendorId;

  const CartItemModel({
    required this.id,
    required this.productId,
    required this.name,
    required this.price,
    required this.quantity,
    required this.imageUrl,
    required this.vendorId,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) =>
      _$CartItemModelFromJson(json);
  Map<String, dynamic> toJson() => _$CartItemModelToJson(this);

  CartItem toEntity() => CartItem(
    id: id,
    productId: productId,
    name: name,
    price: price,
    quantity: quantity,
    imageUrl: imageUrl,
    vendorId: vendorId,
  );

  static CartItemModel fromEntity(CartItem item) => CartItemModel(
    id: item.id,
    productId: item.productId,
    name: item.name,
    price: item.price,
    quantity: item.quantity,
    imageUrl: item.imageUrl,
    vendorId: item.vendorId,
  );
}
