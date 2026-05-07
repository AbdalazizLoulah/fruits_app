import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:fruits_app/core/errors/failure.dart';
import 'package:fruits_app/core/service/api_service.dart';
import 'package:fruits_app/feature/profile/data/model/user_response.dart';
import 'package:fruits_app/feature/profile/data/repo/profile_repo.dart';
import 'package:meta/meta.dart';

part 'get_profile_state.dart';

class GetProfileCubit extends Cubit<GetProfileState> {
  GetProfileCubit(this.profileRepo) : super(GetProfileInitial());
  ProfileRepo profileRepo;
  Future getProfile() async {
    emit(GetProfileLoading());
    var res = await profileRepo.getProfile();
    res.fold(
      (failure) {
        emit(GetProfileFailure(massage: failure.errMassage));
      },
      (data) {
        emit(GetProfileSuccess(data: data));
      },
    );
  }
}
