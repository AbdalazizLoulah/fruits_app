import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ApiService {
  final String _baseurl = 'https://fruits.sys-web.net/api/';
  final Dio dio;

  ApiService({required this.dio});
  Future<Map<String, dynamic>> get({required String endPoint}) async {
    final storage = FlutterSecureStorage();
    String? token = await storage.read(key: "token");
    var res = await dio.get(
      "$_baseurl$endPoint",
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
          "Authorization": "Bearer ${token}",
        },
      ),
    );

    return res.data;
  }

  Future<Map<String, dynamic>> post({
    required String endPoint,
    String? name,
    String? num,
    String? password,
  }) async {
    var res = await dio.post(
      "$_baseurl$endPoint",
      options: Options(
        headers: {
          "Content-Type": "multipart/form-data",
          "Accept": "application/json",
        },
      ),
      queryParameters: {
        "name": name,
        "mobile": num,
        "password": password,
        "phone_email": num,
      },
    );
    return res.data;
  }
}

getToken() async {
  final storage = FlutterSecureStorage();
  String? token = await storage.read(key: "token");
  log(token.toString());
  return token;
}
