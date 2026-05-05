import 'package:fruits_app/feature/home/data/model/vendor_pagination.dart';

class VendorResponse {
  final bool status;
  final VendorPagination data;

  VendorResponse({required this.status, required this.data});

  factory VendorResponse.fromJson(Map<String, dynamic> json) {
    return VendorResponse(
      status: json['status'],
      data: VendorPagination.fromJson(json['data']),
    );
  }
}
