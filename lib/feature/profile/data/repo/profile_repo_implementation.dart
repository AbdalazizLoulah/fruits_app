// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:fruits_app/core/errors/failure.dart';
import 'package:fruits_app/core/service/api_service.dart';
import 'package:fruits_app/feature/profile/data/model/user_response.dart';
import 'package:fruits_app/feature/profile/data/repo/profile_repo.dart';

class ProfileRepoImplementation extends ProfileRepo {
  ApiService apiService;
  ProfileRepoImplementation({
    required this.apiService,
  });
  @override
  Future<Either<Failure, UserResponse>> getProfile()async {
      try {
      var res = await apiService.get(endPoint: "profile",);
      var data = UserResponse.fromJson(res);
      return right(data);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
