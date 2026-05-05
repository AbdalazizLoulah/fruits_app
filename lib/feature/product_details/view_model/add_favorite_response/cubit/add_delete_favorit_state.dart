part of 'add_delete_favorit_cubit.dart';

@immutable
sealed class AddDeleteFavoriteState {}

final class AddDeleteFavoriteInitial extends AddDeleteFavoriteState {}

final class AddDeleteFavoriteLoading extends AddDeleteFavoriteState {}

final class AddDeleteFavoriteSuccess extends AddDeleteFavoriteState {
  final FavoriteResponse data;

  AddDeleteFavoriteSuccess({required this.data});
}

final class AddDeleteFavoriteFailure extends AddDeleteFavoriteState {
  final String massage;

  AddDeleteFavoriteFailure({required this.massage});
}
