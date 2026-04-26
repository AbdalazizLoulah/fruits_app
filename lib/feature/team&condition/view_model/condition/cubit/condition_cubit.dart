import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:fruits_app/core/errors/failure.dart';
import 'package:fruits_app/core/service/api_service.dart';
import 'package:fruits_app/feature/team&condition/data/model/terms_model.dart';
import 'package:meta/meta.dart';

part 'condition_state.dart';

class ConditionCubit extends Cubit<ConditionState> {
  ConditionCubit(this.apiService) : super(ConditionInitial());
  ApiService apiService;
  Future<Either<Failure, TermsModel>> condition() async {
    emit(ConditionLoading());
    try {
      var response = await apiService.get(endPoint: "conditions");
      var data = TermsModel.fromJson(response);
      emit(ConditionSuccess(data: data));
      return right(data);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
      
    }
}
