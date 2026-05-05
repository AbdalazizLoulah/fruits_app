import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:fruits_app/core/errors/failure.dart';
import 'package:fruits_app/core/service/api_service.dart';
import 'package:fruits_app/feature/details_seller/data/models/product_response.dart';
import 'package:meta/meta.dart';

part 'get_product_sells_state.dart';

class GetProductSellsCubit extends Cubit<GetProductSellsState> {
  GetProductSellsCubit(this.apiService) : super(GetProductSellsInitial());
  ApiService apiService;
  Future<Either<Failure, ProductResponse>> getProduct({required int id}) async {
    emit(GetProductSellsLoading());
    try {
      
      var res = await apiService.get(endPoint: "get_vendor_products", id: id);
      
      var data = ProductResponse.fromJson(res);
      log("----------------------------------");
      
      emit(GetProductSellsSuccess(data: data));
      return right(data);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
