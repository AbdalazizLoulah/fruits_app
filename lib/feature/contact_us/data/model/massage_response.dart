class MessageResponse {
  final bool result;
  final String errorMessage;
  final String errorMessageEn;

  MessageResponse({
    required this.result,
    required this.errorMessage,
    required this.errorMessageEn,
  });

  factory MessageResponse.fromJson(Map<String, dynamic> json) {
    return MessageResponse(
      result: json['result'] ?? false,
      errorMessage: json['error_message'] ?? '',
      errorMessageEn: json['error_message_en'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'result': result,
      'error_message': errorMessage,
      'error_message_en': errorMessageEn,
    };
  }
}
