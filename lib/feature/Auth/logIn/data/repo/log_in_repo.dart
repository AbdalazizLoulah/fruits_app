import 'package:dartz/dartz.dart';
import 'package:fruits_app/core/errors/failure.dart';
import 'package:fruits_app/feature/Auth/logIn/data/model/sign_in.dart';

abstract class LogInRepo {
  Future<Either<Failure, SignInModel>> logIn({
    required String phone,
    required String password,
  });
}
