import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:fruits_app/core/errors/failure.dart';
import 'package:fruits_app/core/service/api_service.dart';
import 'package:fruits_app/feature/Auth/signUp/data/model/sign_up_model.dart';
import 'package:fruits_app/feature/Auth/signUp/data/repo/sign_up_repo.dart';
import 'package:meta/meta.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.signUpRepo) : super(SignUpInitial());
  SignUpRepo signUpRepo;
  Future signUp({
    required String name,
    required String num,
    required String password,
  }) async {
    emit(SignUpLoading());
    var res = await signUpRepo.signUp(name: name, num: num, password: password);
    res.fold(
      (failure) {
        emit(SignUpFailure(massage: failure.errMassage));
      },
      (data) {
        emit(SignUpSuccess(data: data));
      },
    );
  }
}
