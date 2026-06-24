import 'package:flutter/material.dart';
import 'package:taima_calculator/source/presentation/widgets/sell_buy_box.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  final ValueNotifier<int> selectedCurrencyId = ValueNotifier<int>(1);

  final ValueNotifier<SellBuyType> sellBuyNotifier = ValueNotifier<SellBuyType>(
    SellBuyType.sell,
  );

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
