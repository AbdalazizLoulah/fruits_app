import 'package:dartz/dartz.dart';
import 'package:fruits_app/core/errors/failure.dart';
import 'package:fruits_app/feature/Auth/signUp/data/model/sign_up_model.dart';

abstract class SignUpRepo {
  Future<Either<Failure, SignUpModel>> signUp({
    required String name,
    required String num,
    required String password,
  });
}
