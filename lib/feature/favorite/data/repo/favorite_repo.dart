import 'package:dartz/dartz.dart';
import 'package:fruits_app/core/errors/failure.dart';
import 'package:fruits_app/feature/favorite/data/model/favorite_response.dart';

abstract class FavoriteRepo {
  Future<Either<Failure, FavoriteResponse>> getUserFavorite();
}
