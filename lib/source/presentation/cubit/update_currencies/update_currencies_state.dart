part of 'update_currencies_cubit.dart';

@immutable
sealed class UpdateCurrenciesState {}

final class UpdateCurrenciesInitial extends UpdateCurrenciesState {}

final class UpdateCurrenciesLoading extends UpdateCurrenciesState {}

final class UpdateCurrenciesSucceded extends UpdateCurrenciesState {}

final class UpdateCurrenciesFailed extends UpdateCurrenciesState {
  final String errorMessage;

  UpdateCurrenciesFailed(this.errorMessage);
}
