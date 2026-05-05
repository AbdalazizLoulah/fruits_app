import 'package:fruits_app/feature/home/data/model/vendor_model.dart';

class VendorPagination {
  final int currentPage;
  final List<VendorModel> vendors;
  final int lastPage;
  final int total;

  VendorPagination({
    required this.currentPage,
    required this.vendors,
    required this.lastPage,
    required this.total,
  });

  factory VendorPagination.fromJson(Map<String, dynamic> json) {
    return VendorPagination(
      currentPage: json['current_page'],
      vendors: List<VendorModel>.from(json['data'].map((e) => VendorModel.fromJson(e))),
      lastPage: json['last_page'],
      total: json['total'],
    );
  }
}
