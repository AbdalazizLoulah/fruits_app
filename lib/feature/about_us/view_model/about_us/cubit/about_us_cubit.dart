import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:fruits_app/core/errors/failure.dart';

import 'package:fruits_app/core/service/api_service.dart';
import 'package:fruits_app/feature/about_us/data/model/about_model.dart';
import 'package:meta/meta.dart';

part 'about_us_state.dart';

class AboutUsCubit extends Cubit<AboutUsState> {
  AboutUsCubit(this.apiService) : super(AboutUsInitial());
  ApiService apiService;
  Future<Either<Failure, AboutModel>> about() async {
    emit(AboutUsLoading());
    try {
      var response = await apiService.get(endPoint: "about-us");
      var data = AboutModel.fromJson(response);
      emit(AboutUsSuccess(data: data));
      return Right(data);
    } catch (e) {
      emit(AboutUsFailure(massage: e.toString()));
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
