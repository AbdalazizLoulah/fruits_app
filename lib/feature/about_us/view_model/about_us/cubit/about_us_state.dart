part of 'about_us_cubit.dart';

@immutable
sealed class AboutUsState {}

final class AboutUsInitial extends AboutUsState {}

final class AboutUsLoading extends AboutUsState {}

final class AboutUsSuccess extends AboutUsState {
  final AboutModel data;

  AboutUsSuccess({required this.data});
}

final class AboutUsFailure extends AboutUsState {
  final String massage;

  AboutUsFailure({required this.massage});
}
