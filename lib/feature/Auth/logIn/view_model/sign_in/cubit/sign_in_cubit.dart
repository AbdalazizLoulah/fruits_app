import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:fruits_app/core/errors/failure.dart';
import 'package:fruits_app/core/service/api_service.dart';
import 'package:fruits_app/feature/Auth/logIn/data/model/sign_in.dart';
import 'package:meta/meta.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit(this.apiService) : super(SignInInitial());
  ApiService apiService;
  Future<Either<Failure, SignInModel>> logIn({
    required String phone,
    required String password,
  }) async {
    emit(SignInLoading());
    try {
      var res = await apiService.post(
        endPoint: "login",
        num: phone,
        password: password,
      );
      var logIn = SignInModel.fromJson(res);
      emit(SignInSuccess(data: logIn));
      return right(logIn);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
    }
  }

