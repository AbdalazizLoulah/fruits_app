import 'package:fruits_app/feature/Auth/signUp/data/model/user_model.dart';

class SignInModel {
  final bool status;
  final String? message;
  final UserData? data;

  SignInModel({required this.status, this.message, this.data});

  factory SignInModel.fromJson(Map<String, dynamic> json) {
    return SignInModel(
      status: json['status'] ?? false,
      message: json['message'],
      data: json['data'] != null ? UserData.fromJson(json['data']) : null,
    );
  }
}
