class AboutModel {
  final bool status;
  final AboutData? data;

  AboutModel({required this.status, this.data});

  factory AboutModel.fromJson(Map<String, dynamic> json) {
    return AboutModel(
      status: json['status'] ?? false,
      data: json['data'] != null ? AboutData.fromJson(json['data']) : null,
    );
  }
}
class AboutData {
  final int? id;
  final int? ord;
  final String? name;
  final String? nameEn;
  final String? img;
  final String? details;
  final String? detailsEn;
  final String? isActive;
  final String? createdAt;
  final String? updatedAt;

  AboutData({
    this.id,
    this.ord,
    this.name,
    this.nameEn,
    this.img,
    this.details,
    this.detailsEn,
    this.isActive,
    this.createdAt,
    this.updatedAt,
  });

  factory AboutData.fromJson(Map<String, dynamic> json) {
    return AboutData(
      id: json['id'],
      ord: json['ord'],
      name: json['name'],
      nameEn: json['name_en'],
      img: json['img'],
      details: json['details'],
      detailsEn: json['details_en'],
      isActive: json['is_active'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
