import 'package:taima_calculator/source/domain/currency.dart';

abstract class CurrencyRepo {
  Future<List<Currency>> fetchCurrencies();
  Future<void> updateCurrencyPrice(int id, double buyPrice, double sellPrice);
  List<Currency> getCurrencies();
}
