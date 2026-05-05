import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:fruits_app/core/errors/failure.dart';
import 'package:fruits_app/core/service/api_service.dart';
import 'package:fruits_app/feature/profile/data/model/user_response.dart';
import 'package:meta/meta.dart';

part 'get_profile_state.dart';

class GetProfileCubit extends Cubit<GetProfileState> {
  GetProfileCubit(this.apiService) : super(GetProfileInitial());
  ApiService apiService;
  Future<Either<Failure, UserResponse>> getProfile() async {
    emit(GetProfileLoading());
    try {
      var res = await apiService.get(endPoint: "profile",);
      var data = UserResponse.fromJson(res);
      
      emit(GetProfileSuccess(data: data));
      return right(data);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
