import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:fruits_app/core/errors/failure.dart';
import 'package:fruits_app/core/service/api_service.dart';
import 'package:fruits_app/feature/favorite/data/model/favorite_response.dart';
import 'package:fruits_app/feature/product_details/data/repo/product_details_repo.dart';
import 'package:meta/meta.dart';
part 'add_delete_favorit_state.dart';

class AddDeleteFavoriteCubit extends Cubit<AddDeleteFavoriteState> {
  AddDeleteFavoriteCubit(this.productDetailsRepo)
    : super(AddDeleteFavoriteInitial());
  ProductDetailsRepo productDetailsRepo;

  Future addDeleteFavorite({required int id}) async {
    emit(AddDeleteFavoriteLoading());
    var res = await productDetailsRepo.addDeleteFavorite(id: id);
    res.fold(
      (failure) {
        emit(AddDeleteFavoriteFailure(massage: failure.errMassage));
      },
      (data) {
        emit(AddDeleteFavoriteSuccess(data: data));
      },
    );
  }
}
