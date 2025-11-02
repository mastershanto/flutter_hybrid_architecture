import 'package:dio/dio.dart';
import '../models/product_model.dart';
import '../../domain/entities/product.dart';

class ProductRemoteDataSource {
  final Dio dio;
  ProductRemoteDataSource(this.dio);

  Future<List<Product>> getProducts() async {
    final response = await dio.get('/products');
    return (response.data as List)
        .map((json) => ProductModel.fromJson(json).toEntity())
        .toList();
  }

  Future<Product> getProductById(String id) async {
    final response = await dio.get('/products/$id');
    return ProductModel.fromJson(response.data).toEntity();
  }

  Future<List<Product>> getProductsByVendor(String vendorId) async {
    final response = await dio.get('/products?vendor_id=$vendorId');
    return (response.data as List)
        .map((json) => ProductModel.fromJson(json).toEntity())
        .toList();
  }

  Future<void> addProduct(Product product) async {
    await dio.post(
      '/products',
      data: ProductModel.fromEntity(product).toJson(),
    );
  }

  Future<void> updateProduct(Product product) async {
    await dio.put(
      '/products/${product.id}',
      data: ProductModel.fromEntity(product).toJson(),
    );
  }

  Future<void> deleteProduct(String id) async {
    await dio.delete('/products/$id');
  }
}
