part of 'condition_cubit.dart';

@immutable
sealed class ConditionState {}

final class ConditionInitial extends ConditionState {}

final class ConditionLoading extends ConditionState {}

final class ConditionSuccess extends ConditionState {
  final TermsModel data;

  ConditionSuccess({required this.data});
}

final class ConditionFailure extends ConditionState {
  final String massage;

  ConditionFailure({required this.massage});
}
