import 'package:equatable/equatable.dart';

class Vendor extends Equatable {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String address;
  final String logoUrl;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Vendor({
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

  @override
  List<Object?> get props => [
    id,
    name,
    email,
    phone,
    address,
    logoUrl,
    isActive,
    createdAt,
    updatedAt,
  ];
}
