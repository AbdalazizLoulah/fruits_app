class TermsModel {
  final bool status;
  final TermsData? data;

  TermsModel({required this.status, this.data});

  factory TermsModel.fromJson(Map<String, dynamic> json) {
    return TermsModel(
      status: json['status'] ?? false,
      data: json['data'] != null ? TermsData.fromJson(json['data']) : null,
    );
  }
}
class TermsData {
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

  TermsData({
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

  factory TermsData.fromJson(Map<String, dynamic> json) {
    return TermsData(
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
