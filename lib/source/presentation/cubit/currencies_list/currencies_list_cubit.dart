import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:taima_calculator/source/data/db.dart';
import 'package:taima_calculator/source/domain/currency.dart';

part 'currencies_list_state.dart';

class CurrenciesListCubit extends Cubit<CurrenciesListState> {
  CurrenciesListCubit() : super(CurrenciesListInitial());
  final hive = CurrencyHiveService();

  List<Currency> fetchCurrencies() {
    emit(CurrenciesListLoading());
    try {
      final currencies = hive.fetchAllCurrencies();

      emit(CurrenciesListLoaded(currencies));
      return currencies;
    } catch (e) {
      emit(CurrenciesListError(e.toString()));
    }
    return [];
  }
}
