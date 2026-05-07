// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:fruits_app/core/errors/failure.dart';
import 'package:fruits_app/core/service/api_service.dart';
import 'package:fruits_app/feature/details_seller/data/models/product_response.dart';
import 'package:fruits_app/feature/favorite/data/model/favorite_response.dart';
import 'package:fruits_app/feature/product_details/data/repo/product_details_repo.dart';

class ProductDetailsRepoImplementation extends ProductDetailsRepo {
  ApiService apiService;
  ProductDetailsRepoImplementation({
    required this.apiService,
  });
  @override
  Future<Either<Failure, FavoriteResponse>> addDeleteFavorite({
    required int id,
  })async {
    try {
      var res = await apiService.post(endPoint: "user_favorite", id: id);
      
      var data = FavoriteResponse.fromJson(res);
      return right(data);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
    
  }

  @override
  Future<Either<Failure, ProductResponse>> getProductSells({required int id})async {
    try {
      
      var res = await apiService.get(endPoint: "get_vendor_products", id: id);
      
      var data = ProductResponse.fromJson(res);
      return right(data);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
