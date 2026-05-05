part of 'get_product_sells_cubit.dart';

@immutable
sealed class GetProductSellsState {}

final class GetProductSellsInitial extends GetProductSellsState {}

final class GetProductSellsLoading extends GetProductSellsState {}

final class GetProductSellsSuccess extends GetProductSellsState {
  final ProductResponse data;

  GetProductSellsSuccess({required this.data});
}

final class GetProductSellsFailure extends GetProductSellsState {
  final String massage;

  GetProductSellsFailure({required this.massage});
}
