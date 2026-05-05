part of 'get_seller_cubit.dart';

@immutable
sealed class GetSellerState {}

final class GetSellerInitial extends GetSellerState {}

final class GetSellerLoading extends GetSellerState {}

final class GetSellerSuccess extends GetSellerState {
  final VendorResponse data;

  GetSellerSuccess({required this.data});
}

final class GetSellerFailure extends GetSellerState {
  final String massage;

  GetSellerFailure({required this.massage});
}
