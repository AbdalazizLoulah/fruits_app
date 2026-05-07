import 'package:dartz/dartz.dart';
import 'package:fruits_app/core/errors/failure.dart';
import 'package:fruits_app/feature/contact_us/data/model/massage_response.dart';

abstract class ContactUsRepo {
  Future<Either<Failure, MessageResponse>> sendMassage({
    required String name,
    required String massage,
    required String mobile,
  });
}
