import '../entities/vendor.dart';
import '../repositories/vendor_repository.dart';

class GetVendors {
  final VendorRepository repository;
  GetVendors(this.repository);

  Future<List<Vendor>> call() async {
    return await repository.getVendors();
  }
}
