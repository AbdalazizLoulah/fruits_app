class FavoriteResponse {
  final bool result;
  final String errorMessage;
  final String errorMessageEn;
  final int insertId;

  FavoriteResponse({
    required this.result,
    required this.errorMessage,
    required this.errorMessageEn,
    required this.insertId,
  });

  factory FavoriteResponse.fromJson(Map<String, dynamic> json) {
    return FavoriteResponse(
      result: json['result'] ?? false,
      errorMessage: json['error_mesage'] ?? '',
      errorMessageEn: json['error_mesage_en'] ?? '',
      insertId: json['insert_id'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'result': result,
      'error_mesage': errorMessage,
      'error_mesage_en': errorMessageEn,
      'insert_id': insertId,
    };
  }
}
