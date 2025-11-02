import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/product.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductModel {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final String categoryId;
  final String brandId;
  final String vendorId;
  final int stock;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;

  const ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.categoryId,
    required this.brandId,
    required this.vendorId,
    required this.stock,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductModelToJson(this);

  Product toEntity() => Product(
    id: id,
    name: name,
    description: description,
    price: price,
    imageUrl: imageUrl,
    categoryId: categoryId,
    brandId: brandId,
    vendorId: vendorId,
    stock: stock,
    isActive: isActive,
    createdAt: createdAt,
    updatedAt: updatedAt,
  );

  static ProductModel fromEntity(Product product) => ProductModel(
    id: product.id,
    name: product.name,
    description: product.description,
    price: product.price,
    imageUrl: product.imageUrl,
    categoryId: product.categoryId,
    brandId: product.brandId,
    vendorId: product.vendorId,
    stock: product.stock,
    isActive: product.isActive,
    createdAt: product.createdAt,
    updatedAt: product.updatedAt,
  );
}
