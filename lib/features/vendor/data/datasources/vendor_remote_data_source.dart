import 'package:dio/dio.dart';
import '../models/vendor_model.dart';
import 'package:todo_flutter_hybrid/core/config/api_config.dart';

class VendorRemoteDataSource {
  final Dio dio;
  VendorRemoteDataSource(this.dio);

  Future<List<VendorModel>> getVendors() async {
    final response = await dio.get(ApiConfig.vendors);
    final data = response.data as List;
    return data.map((json) => VendorModel.fromJson(json)).toList();
  }

  Future<VendorModel> getVendorById(String id) async {
    final response = await dio.get('${ApiConfig.vendors}/$id');
    return VendorModel.fromJson(response.data);
  }

  Future<void> addVendor(VendorModel vendor) async {
    await dio.post(ApiConfig.vendors, data: vendor.toJson());
  }

  Future<void> updateVendor(VendorModel vendor) async {
    await dio.put('${ApiConfig.vendors}/${vendor.id}', data: vendor.toJson());
  }

  Future<void> deleteVendor(String id) async {
    await dio.delete('${ApiConfig.vendors}/$id');
  }
}
