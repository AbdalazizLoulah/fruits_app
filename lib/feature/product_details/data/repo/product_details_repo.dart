// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:fruits_app/core/errors/failure.dart';

import 'package:fruits_app/feature/details_seller/data/models/product_response.dart';
import 'package:fruits_app/feature/favorite/data/model/favorite_response.dart';

abstract class ProductDetailsRepo {
  Future<Either<Failure, ProductResponse>> getProductSells({required int id});
  Future<Either<Failure, FavoriteResponse>> addDeleteFavorite({
    required int id,
  });
}
