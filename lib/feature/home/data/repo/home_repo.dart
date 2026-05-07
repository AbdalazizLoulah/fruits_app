import 'package:dartz/dartz.dart';
import 'package:fruits_app/core/errors/failure.dart';
import 'package:fruits_app/feature/home/data/model/vendor_response.dart';

abstract class HomeRepo {
  Future<Either<Failure, VendorResponse>> getSellers();
}
