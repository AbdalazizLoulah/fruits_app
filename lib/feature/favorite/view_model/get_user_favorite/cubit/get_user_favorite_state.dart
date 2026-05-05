part of 'get_user_favorite_cubit.dart';

@immutable
sealed class GetUserFavoriteState {}

final class GetUserFavoriteInitial extends GetUserFavoriteState {}

final class GetUserFavoriteLoading extends GetUserFavoriteState {}

final class GetUserFavoriteSuccess extends GetUserFavoriteState {
  final FavoriteResponse data;

  GetUserFavoriteSuccess({required this.data});
}

final class GetUserFavoriteFailure extends GetUserFavoriteState {
  final String massage;

  GetUserFavoriteFailure({required this.massage});
}
