part of 'currencies_list_cubit.dart';

@immutable
sealed class CurrenciesListState {}

final class CurrenciesListInitial extends CurrenciesListState {}

final class CurrenciesListLoading extends CurrenciesListState {}

final class CurrenciesListError extends CurrenciesListState {
  final String message;

  CurrenciesListError(this.message);
}

final class CurrenciesListLoaded extends CurrenciesListState {
  final List<Currency> currencies;

  CurrenciesListLoaded(this.currencies);
}
