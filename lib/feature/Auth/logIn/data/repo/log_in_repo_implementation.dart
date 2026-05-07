// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:fruits_app/core/errors/failure.dart';
import 'package:fruits_app/core/service/api_service.dart';
import 'package:fruits_app/feature/Auth/logIn/data/model/sign_in.dart';
import 'package:fruits_app/feature/Auth/logIn/data/repo/log_in_repo.dart';

class LogInRepoImplementation extends LogInRepo {
  ApiService apiService;
  LogInRepoImplementation({
    required this.apiService,
  });
  @override
  Future<Either<Failure, SignInModel>> logIn({
    required String phone,
    required String password,
  }) async{
    try {
      var res = await apiService.post(
        endPoint: "login",
        num: phone,
        password: password,
      );
      var logIn = SignInModel.fromJson(res);
      
      return right(logIn);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
