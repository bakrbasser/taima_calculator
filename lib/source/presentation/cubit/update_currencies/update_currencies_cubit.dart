import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:taima_calculator/source/data/db.dart';

part 'update_currencies_state.dart';

class UpdateCurrenciesCubit extends Cubit<UpdateCurrenciesState> {
  UpdateCurrenciesCubit() : super(UpdateCurrenciesInitial());
  final hive = CurrencyHiveService();

  Future<void> updateCurrencies(
    int id,
    double newSellPrice,
    double newBuyPrice,
  ) async {
    emit(UpdateCurrenciesLoading());
    try {
      await hive.updateCurrencyPriceSingle(
        id,
        sellPrice: newSellPrice,
        buyPrice: newBuyPrice,
      );
      emit(UpdateCurrenciesSucceded());
    } catch (e) {
      emit(UpdateCurrenciesFailed(e.toString()));
    }
  }
}
