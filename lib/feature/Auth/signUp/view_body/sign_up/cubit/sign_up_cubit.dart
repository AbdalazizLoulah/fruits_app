import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:fruits_app/core/errors/failure.dart';
import 'package:fruits_app/core/service/api_service.dart';
import 'package:fruits_app/feature/Auth/signUp/data/model/sign_up_model.dart';
import 'package:meta/meta.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.apiService) : super(SignUpInitial());
  ApiService apiService;
  Future<Either<Failure, SignUpModel>> signUp({
    required String name,
    required String num,
    required String password,
  }) async {
    emit(SignUpLoading());

    try {
      final respons = await apiService.post(
        endPoint: "register",
        name: name,
        num: num,
        password: password,
      );
      var register = SignUpModel.fromJson(respons);
      emit(SignUpSuccess(data: register));
      return right(register);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
    }
  }

