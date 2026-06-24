import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taima_calculator/source/colors.dart';
import 'package:taima_calculator/source/presentation/cubit/currencies_list/currencies_list_cubit.dart';
import 'package:taima_calculator/source/presentation/cubit/update_currencies/update_currencies_cubit.dart';
import 'package:taima_calculator/source/presentation/widgets/amount_entry_field.dart';
import 'package:taima_calculator/source/presentation/widgets/sell_buy_box.dart';
import 'package:taima_calculator/source/theme.dart';

class SelectedCurrencyPrice extends StatefulWidget {
  const SelectedCurrencyPrice({
    super.key,
    required this.selectedCurrencyId,
    required this.sellBuyNotifier,
  });
  final ValueNotifier<int> selectedCurrencyId;
  final ValueNotifier<SellBuyType> sellBuyNotifier;

  @override
  State<SelectedCurrencyPrice> createState() => _SelectedCurrencyPriceState();
}

class _SelectedCurrencyPriceState extends State<SelectedCurrencyPrice> {
  @override
  void initState() {
    super.initState();

    widget.selectedCurrencyId.addListener(() {
      setState(() {});
    });
    widget.sellBuyNotifier.addListener(() {
      setState(() {});
    });
  }

  double get getPrice {
    final currencies = context.read<CurrenciesListCubit>().fetchCurrencies();
    final selectedCurrency = currencies.firstWhere(
      (currency) => currency.id == widget.selectedCurrencyId.value,
    );
    if (widget.sellBuyNotifier.value == SellBuyType.sell) {
      return selectedCurrency.sellPrice;
    }
    return selectedCurrency.buyPrice;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UpdateCurrenciesCubit, UpdateCurrenciesState>(
      listener: (context, state) {
        if (state is UpdateCurrenciesSucceded) {
          setState(() {});
        }
      },
      child: Row(
        children: [
          Text(
            'سعر صرف العملة المختارة : ',
            style: textTheme(context).bodyLarge!.copyWith(
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          SizedBox(width: 8),
          Text(
            formatNumber(getPrice.toString()),
            style: textTheme(context).bodyLarge!.copyWith(
              fontWeight: FontWeight.w700,
              color: deepGreen,
              fontSize: 24,
            ),
          ),
        ],
      ),
    );
  }
}
