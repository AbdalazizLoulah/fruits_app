class VendorModel {
  final int id;
  final String name;
  final String nameEn;
  final String img;
  final int categoryId;
  final int regionId;
  final double? deliveryCharges;
  final String isOpened;
  final String rate;

  VendorModel({
    required this.id,
    required this.name,
    required this.nameEn,
    required this.img,
    required this.categoryId,
    required this.regionId,
    this.deliveryCharges,
    required this.isOpened,
    required this.rate,
  });

  factory VendorModel.fromJson(Map<String, dynamic> json) {
    return VendorModel(
      id: json['id'],
      name: json['name'],
      nameEn: json['name_en'],
      img: json['img'],
      categoryId: json['category_id'],
      regionId: json['region_id'],
      deliveryCharges: json['delivery_charges'] != null
          ? double.tryParse(json['delivery_charges'].toString())
          : null,
      isOpened: json['is_opened'],
      rate: json['rate'],
    );
  }
}
