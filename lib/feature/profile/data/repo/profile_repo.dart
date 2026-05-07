import 'package:dartz/dartz.dart';
import 'package:fruits_app/core/errors/failure.dart';
import 'package:fruits_app/feature/profile/data/model/user_response.dart';

abstract class ProfileRepo {
  Future<Either<Failure, UserResponse>> getProfile();
}
