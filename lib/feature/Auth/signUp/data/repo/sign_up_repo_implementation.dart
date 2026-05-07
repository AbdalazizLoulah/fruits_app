// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:fruits_app/core/errors/failure.dart';
import 'package:fruits_app/core/service/api_service.dart';
import 'package:fruits_app/feature/Auth/signUp/data/model/sign_up_model.dart';
import 'package:fruits_app/feature/Auth/signUp/data/repo/sign_up_repo.dart';

class SignUpRepoImplementation extends SignUpRepo {
  ApiService apiService;
  SignUpRepoImplementation({
    required this.apiService,
  });
  @override
  Future<Either<Failure, SignUpModel>> signUp({
    required String name,
    required String num,
    required String password,
  }) async{
    try {
      final respons = await apiService.post(
        endPoint: "register",
        name: name,
        num: num,
        password: password,
      );
      var register = SignUpModel.fromJson(respons);
      return right(register);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
