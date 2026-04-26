part of 'get_profile_cubit.dart';

@immutable
sealed class GetProfileState {}

final class GetProfileInitial extends GetProfileState {}

final class GetProfileLoading extends GetProfileState {}

final class GetProfileSuccess extends GetProfileState {
  final UserResponse data;

  GetProfileSuccess({required this.data});
}

final class GetProfileFailure extends GetProfileState {
  final String massage;

  GetProfileFailure({required this.massage});
}
