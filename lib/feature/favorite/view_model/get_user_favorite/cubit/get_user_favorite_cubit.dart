

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:fruits_app/core/errors/failure.dart';
import 'package:fruits_app/core/service/api_service.dart';
import 'package:fruits_app/feature/favorite/data/model/favorite_response.dart';

import 'package:meta/meta.dart';

part 'get_user_favorite_state.dart';

class GetUserFavoriteCubit extends Cubit<GetUserFavoriteState> {
  GetUserFavoriteCubit(this.apiService) : super(GetUserFavoriteInitial());
  ApiService apiService;
  Future<Either<Failure, FavoriteResponse>> getUserFavorite() async {
    emit(GetUserFavoriteLoading());
    try {
      var res = await apiService.get(endPoint: "user_favorite/t/ar");
      
      var data = FavoriteResponse.fromJson(res);


      emit(GetUserFavoriteSuccess(data: data));
      return right(data);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      emit(GetUserFavoriteFailure(massage: "$e"));
      return Left(ServerFailure(e.toString()));
    }
  }
}
