import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:fruits_app/core/errors/failure.dart';
import 'package:fruits_app/core/service/api_service.dart';
import 'package:fruits_app/feature/favorite/data/model/favorite_response.dart';
import 'package:fruits_app/feature/favorite/data/repo/favorite_repo.dart';

import 'package:meta/meta.dart';

part 'get_user_favorite_state.dart';

class GetUserFavoriteCubit extends Cubit<GetUserFavoriteState> {
  GetUserFavoriteCubit(this.favoriteRepo) : super(GetUserFavoriteInitial());
  FavoriteRepo favoriteRepo;
  Future getUserFavorite() async {
    emit(GetUserFavoriteLoading());
    var res = await favoriteRepo.getUserFavorite();
    res.fold(
      (failure) {
        emit(GetUserFavoriteFailure(massage: failure.errMassage));
      },
      (data) {
        emit(GetUserFavoriteSuccess(data: data));
      },
    );
  }
}
