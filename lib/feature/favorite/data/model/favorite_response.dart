import 'package:fruits_app/feature/favorite/data/model/favorite_item.dart';

class FavoriteResponse {
  final bool result;
  final String message;
  final String messageEn;
  final List<FavoriteItem> data;

  FavoriteResponse({
    required this.result,
    required this.message,
    required this.messageEn,
    required this.data,
  });

  factory FavoriteResponse.fromJson(Map<String, dynamic> json) {
    return FavoriteResponse(
      result: json['result'] ?? false,
      message: json['error_message'] ?? '',
      messageEn: json['error_message_en'] ?? '',
      data:
          (json['data'] as List?)
              ?.map((e) => FavoriteItem.fromJson(e))
              .toList() ??
          [],
    );
  }
}
