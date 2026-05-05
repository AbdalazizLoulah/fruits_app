import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:fruits_app/core/errors/failure.dart';
import 'package:fruits_app/core/service/api_service.dart';
import 'package:fruits_app/feature/home/data/model/vendor_response.dart';
import 'package:meta/meta.dart';
part 'get_seller_state.dart';

class GetSellerCubit extends Cubit<GetSellerState> {
  GetSellerCubit(this.apiService) : super(GetSellerInitial());
  ApiService apiService;
  Future<Either<Failure, VendorResponse>> getSellers() async {
    emit(GetSellerLoading());
    try {
      var res = await apiService.get(endPoint: "getvendors");
      var data = VendorResponse.fromJson(res);
      emit(GetSellerSuccess(data: data));
      return right(data);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
