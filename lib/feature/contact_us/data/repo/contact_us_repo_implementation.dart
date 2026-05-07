// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:fruits_app/core/errors/failure.dart';
import 'package:fruits_app/core/service/api_service.dart';
import 'package:fruits_app/feature/contact_us/data/model/massage_response.dart';
import 'package:fruits_app/feature/contact_us/data/repo/contact_us_repo.dart';

class ContactUsRepoImplementation extends ContactUsRepo {
  ApiService apiService;
  ContactUsRepoImplementation({
    required this.apiService,
  });
  @override
  Future<Either<Failure, MessageResponse>> sendMassage({
    required String name,
    required String massage,
    required String mobile,
  })async {
    try {
      var res = await apiService.post(
        endPoint: "contact_us",
        name: name,massage: massage,num: mobile
      );
      var data = MessageResponse.fromJson(res);
      
      
      return right(data);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
