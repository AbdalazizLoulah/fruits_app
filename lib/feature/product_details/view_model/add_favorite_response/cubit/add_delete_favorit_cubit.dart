import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:fruits_app/core/errors/failure.dart';
import 'package:fruits_app/core/service/api_service.dart';
import 'package:fruits_app/feature/product_details/data/models/favorite_response_model.dart';
import 'package:meta/meta.dart';

part 'add_delete_favorit_state.dart';

class AddDeleteFavoriteCubit extends Cubit<AddDeleteFavoriteState> {
  AddDeleteFavoriteCubit(this.apiService) : super(AddDeleteFavoriteInitial());
  ApiService apiService;
  void reloade() {
    emit(AddDeleteFavoriteInitial());
  }

  Future<Either<Failure, FavoriteResponse>> addDeleteFavorite({
    required int id,
  }) async {
    emit(AddDeleteFavoriteLoading());
    log("loading");
    try {
      var res = await apiService.post(endPoint: "user_favorite", id: id);
      log("${res}");
      var data = FavoriteResponse.fromJson(res);

      emit(AddDeleteFavoriteSuccess(data: data));
      log("success");
      return right(data);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      emit(AddDeleteFavoriteFailure(massage: "$e"));
      return Left(ServerFailure(e.toString()));
    }
  }
}
