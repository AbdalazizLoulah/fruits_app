import 'package:fruits_app/feature/details_seller/data/models/product_model.dart';

class ProductResponse {
  final bool status;
  final List<ProductModel> data;

  ProductResponse({required this.status, required this.data});

  factory ProductResponse.fromJson(Map<String, dynamic> json) {
    return ProductResponse(
      status: json['status'] ?? false,
      data: (json['data'] as List? ?? [])
          .map((e) => ProductModel.fromJson(e))
          .toList(),
    );
  }
}
