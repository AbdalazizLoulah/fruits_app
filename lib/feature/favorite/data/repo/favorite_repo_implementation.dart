// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:fruits_app/core/errors/failure.dart';
import 'package:fruits_app/core/service/api_service.dart';
import 'package:fruits_app/feature/favorite/data/model/favorite_response.dart';
import 'package:fruits_app/feature/favorite/data/repo/favorite_repo.dart';

class FavoriteRepoImplementation extends FavoriteRepo {
  ApiService apiService;
  FavoriteRepoImplementation({
    required this.apiService,
  });
  @override
  Future<Either<Failure, FavoriteResponse>> getUserFavorite()async {
    try {
      var res = await apiService.get(endPoint: "user_favorite/t/ar");
      
      var data = FavoriteResponse.fromJson(res);
      return right(data);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
