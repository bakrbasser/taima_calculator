// db.dart
import 'package:hive_flutter/hive_flutter.dart';
import 'package:taima_calculator/source/domain/currency.dart';

final defaultCurrencies = [
  const Currency(
    id: 1,
    name: 'دولار امريكي',
    sellPrice: 0.0,
    buyPrice: 0.0,
  ), // دولار
  const Currency(id: 2, name: 'يورو', sellPrice: 0.0, buyPrice: 0.0), // يورو
  const Currency(
    id: 3,
    name: 'ريال سعودي',
    sellPrice: 0.0,
    buyPrice: 0.0,
  ), // ريال سعودي
  const Currency(
    id: 4,
    name: 'ليرة تركية',
    sellPrice: 0.0,
    buyPrice: 0.0,
  ), // ليرة تركية
];

// Hive Service class to manage Currency operations
class CurrencyHiveService {
  static final CurrencyHiveService _instance = CurrencyHiveService._internal();
  factory CurrencyHiveService() => _instance;

  static const String _boxName = 'currenciesBox';
  late Box _box;

  // Private constructor - initializes immediately
  CurrencyHiveService._internal();

  // Initialize the Hive box
  Future<void> init() async {
    _box = await Hive.openBox(_boxName);

    if (_box.isEmpty) {
      await _initializeDefaultCurrencies();
    }
  }

  // Initialize default currencies
  Future<void> _initializeDefaultCurrencies() async {
    final Map<String, dynamic> batchMap = {};
    for (var currency in defaultCurrencies) {
      batchMap[currency.id.toString()] = currency.toMap();
    }
    await _box.putAll(batchMap);
  }

  // Save a single currency
  Future<void> saveCurrency(Currency currency) async {
    await _box.put(currency.id.toString(), currency.toMap());
  }

  // Save multiple currencies
  Future<void> saveCurrencies(List<Currency> currencies) async {
    final Map<String, dynamic> batchMap = {};
    for (var currency in currencies) {
      batchMap[currency.id.toString()] = currency.toMap();
    }
    await _box.putAll(batchMap);
  }

  /// Fetch all currencies from Hive
  List<Currency> fetchAllCurrencies() {
    final List<Currency> currencies = [];

    // Iterate through all values in the box
    for (var value in _box.values) {
      if (value is Map) {
        currencies.add(Currency.fromMap(value));
      }
    }

    // Sort by id for consistent ordering
    return currencies;
  }

  Future<bool> updateCurrencyPriceSingle(
    int currencyId, {
    double? sellPrice,
    double? buyPrice,
  }) async {
    final key = currencyId.toString();

    if (!_box.containsKey(key)) {
      return false; // Currency not found
    }

    final Map<String, dynamic> data = Map<String, dynamic>.from(
      _box.get(key) as Map,
    );

    if (sellPrice != null) {
      data['sellPrice'] = sellPrice;
    }
    if (buyPrice != null) {
      data['buyPrice'] = buyPrice;
    }

    await _box.put(key, data);
    return true;
  }

  /// Get a single currency by ID
  Currency? getCurrency(int currencyId) {
    final key = currencyId.toString();
    if (!_box.containsKey(key)) {
      return null;
    }
    final data = _box.get(key) as Map<String, dynamic>;
    return Currency.fromMap(data);
  }

  /// Delete a currency by ID
  Future<void> deleteCurrency(int currencyId) async {
    await _box.delete(currencyId.toString());
  }
}
