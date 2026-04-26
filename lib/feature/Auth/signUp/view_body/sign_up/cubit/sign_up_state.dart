part of 'sign_up_cubit.dart';

@immutable
sealed class SignUpState {}

final class SignUpInitial extends SignUpState {}

final class SignUpSuccess extends SignUpState {
  final SignUpModel data;

  SignUpSuccess({required this.data});
}

final class SignUpFailure extends SignUpState {
  final String massage;

  SignUpFailure({required this.massage});
}

final class SignUpLoading extends SignUpState {}
