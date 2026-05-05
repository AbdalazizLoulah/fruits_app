class Product {
  final int id;
  final String name;
  final String nameEn;
  final String unit;
  final String unitEn;
  final int price;
  final int discount;
  final int quantity;
  final String img;
  final String details;
  final String detailsEn;
  final int categoryId;
  final String nameCategory;
  final String nameCategoryEn;

  Product({
    required this.id,
    required this.name,
    required this.nameEn,
    required this.unit,
    required this.unitEn,
    required this.price,
    required this.discount,
    required this.quantity,
    required this.img,
    required this.details,
    required this.detailsEn,
    required this.categoryId,
    required this.nameCategory,
    required this.nameCategoryEn,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      nameEn: json['name_en'],
      unit: json['unit'],
      unitEn: json['unit_en'],
      price: json['price'],
      discount: json['discount'],
      quantity: json['quantity'],
      img: json['img'],
      details: json['details'],
      detailsEn: json['details_en'],
      categoryId: json['category_id'],
      nameCategory: json['name_category'],
      nameCategoryEn: json['name_category_en'],
    );
  }
}
