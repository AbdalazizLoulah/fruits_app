part of 'auth_phone_cubit.dart';

@immutable
sealed class AuthPhoneState {}

final class AuthPhoneInitial extends AuthPhoneState {}

final class AuthPhoneLoading extends AuthPhoneState {}

final class AuthPhoneSuccess extends AuthPhoneState {}

final class AuthPhoneFailure extends AuthPhoneState {
  final String massage;

  AuthPhoneFailure({required this.massage});
}

final class AuthPhoneOtpSuccess extends AuthPhoneState {}
