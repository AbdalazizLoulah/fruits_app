import 'package:hive/hive.dart';

part 'product_model.g.dart';

@HiveType(typeId: 0)
class ProductModel extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String nameEn;

  @HiveField(3)
  final int vendorId;

  @HiveField(4)
  final int categoryId;

  @HiveField(5)
  final int quantity;

  @HiveField(6)
  final double price;

  @HiveField(7)
  final double priceAfterDiscount;

  @HiveField(8)
  final int discount;

  @HiveField(9)
  final String img;

  @HiveField(10)
  final String details;

  @HiveField(11)
  final String detailsEn;

  @HiveField(12)
  final String unit;

  @HiveField(13)
  final String unitEn;

  @HiveField(14)
  final String categoryName;

  @HiveField(15)
  final String categoryNameEn;

  @HiveField(16)
  final int isFavorite;

  @HiveField(17)
  final List<dynamic> attributes;

  @HiveField(18)
  final List<dynamic> productAttributesValues;

  @HiveField(19)
  final List<dynamic> subUnits;

  ProductModel({
    required this.id,
    required this.name,
    required this.nameEn,
    required this.vendorId,
    required this.categoryId,
    required this.quantity,
    required this.price,
    required this.priceAfterDiscount,
    required this.discount,
    required this.img,
    required this.details,
    required this.detailsEn,
    required this.unit,
    required this.unitEn,
    required this.categoryName,
    required this.categoryNameEn,
    required this.isFavorite,
    required this.attributes,
    required this.productAttributesValues,
    required this.subUnits,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? "",
      nameEn: json['name_en'] ?? "",
      vendorId: json['vendor_id'] ?? 0,
      categoryId: json['category_id'] ?? 0,
      quantity: json['quantity'] ?? 0,
      price: double.parse(json['price'].toString()),
      priceAfterDiscount: double.parse(json['price_after_discount'].toString()),
      discount: json['discount'] ?? 0,
      img: json['img'] ?? "",
      details: json['details'] ?? "",
      detailsEn: json['details_en'] ?? "",
      unit: json['unit'] ?? "",
      unitEn: json['unit_en'] ?? "",
      categoryName: json['name_category'] ?? "",
      categoryNameEn: json['name_category_en'] ?? "",
      isFavorite: json['is_favorite'] ?? 0,
      attributes: json['attributes'] ?? [],
      productAttributesValues: json['product_attributes_values'] ?? [],
      subUnits: json['sub_units'] ?? [],
    );
  }
}
