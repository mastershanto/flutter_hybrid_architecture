import '../../domain/entities/product.dart';
import '../../domain/repositories/product_repository.dart';
import '../datasources/product_remote_data_source.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;
  ProductRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<Product>> getProducts() async {
    return await remoteDataSource.getProducts();
  }

  @override
  Future<Product> getProductById(String id) async {
    return await remoteDataSource.getProductById(id);
  }

  @override
  Future<List<Product>> getProductsByVendor(String vendorId) async {
    return await remoteDataSource.getProductsByVendor(vendorId);
  }

  @override
  Future<void> addProduct(Product product) async {
    await remoteDataSource.addProduct(product);
  }

  @override
  Future<void> updateProduct(Product product) async {
    await remoteDataSource.updateProduct(product);
  }

  @override
  Future<void> deleteProduct(String id) async {
    await remoteDataSource.deleteProduct(id);
  }
}
