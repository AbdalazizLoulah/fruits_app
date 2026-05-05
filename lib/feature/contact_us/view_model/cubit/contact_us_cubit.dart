import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:fruits_app/core/errors/failure.dart';
import 'package:fruits_app/core/service/api_service.dart';
import 'package:fruits_app/feature/contact_us/data/model/massage_response.dart';
import 'package:meta/meta.dart';

part 'contact_us_state.dart';

class ContactUsCubit extends Cubit<ContactUsState> {
  ContactUsCubit(this.apiService) : super(ContactUsInitial());
  ApiService apiService;
  Future<Either<Failure, MessageResponse>> seendMassage({
    required String name,
    required String massage,
    required String mobile,
  }) async {
    emit(ContactUsLoading());
    try {
      var res = await apiService.post(
        endPoint: "contact_us",
        name: name,massage: massage,num: mobile
      );
      var data = MessageResponse.fromJson(res);
      emit(ContactUsSuccess(data: data));
      
      return right(data);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
