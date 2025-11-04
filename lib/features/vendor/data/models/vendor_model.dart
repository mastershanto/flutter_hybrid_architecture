import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/vendor.dart';

part 'vendor_model.g.dart';

@JsonSerializable()
class VendorModel {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String address;
  final String logoUrl;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;

  const VendorModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
    required this.logoUrl,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });

  factory VendorModel.fromJson(Map<String, dynamic> json) =>
      _$VendorModelFromJson(json);
  Map<String, dynamic> toJson() => _$VendorModelToJson(this);

  Vendor toEntity() => Vendor(
    id: id,
    name: name,
    email: email,
    phone: phone,
    address: address,
    logoUrl: logoUrl,
    isActive: isActive,
    createdAt: createdAt,
    updatedAt: updatedAt,
  );

  static VendorModel fromEntity(Vendor vendor) => VendorModel(
    id: vendor.id,
    name: vendor.name,
    email: vendor.email,
    phone: vendor.phone,
    address: vendor.address,
    logoUrl: vendor.logoUrl,
    isActive: vendor.isActive,
    createdAt: vendor.createdAt,
    updatedAt: vendor.updatedAt,
  );
}
