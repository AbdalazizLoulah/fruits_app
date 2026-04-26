import 'package:fruits_app/feature/Auth/signUp/data/model/user_model.dart';

class SignUpModel {
  final bool status;
  final String? errorMessage;
  final String? errorMessageEn;
  final UserData? data;

  SignUpModel({
    required this.status,
    this.errorMessage,
    this.errorMessageEn,
    this.data,
  });

  factory SignUpModel.fromJson(Map<String, dynamic> json) {
    return SignUpModel(
      status: json['status'] ?? false,
      errorMessage: json['error_message'],
      errorMessageEn: json['error_message_en'],
      data: json['data'] != null ? UserData.fromJson(json['data']) : null,
    );
  }
}
