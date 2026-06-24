import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taima_calculator/source/colors.dart';
import 'package:taima_calculator/source/domain/currency.dart';
import 'package:taima_calculator/source/presentation/cubit/update_currencies/update_currencies_cubit.dart';
import 'package:taima_calculator/source/presentation/dialogs.dart';
import 'package:taima_calculator/source/presentation/widgets/amount_entry_field.dart';
import 'package:taima_calculator/source/theme.dart';

class UpdateCurrenciesPricePage extends StatefulWidget {
  const UpdateCurrenciesPricePage({super.key, required this.currency});
  final Currency currency;

  @override
  State<UpdateCurrenciesPricePage> createState() =>
      _UpdateCurrenciesPricePageState();
}

class _UpdateCurrenciesPricePageState extends State<UpdateCurrenciesPricePage> {
  TextEditingController buyController = TextEditingController();
  TextEditingController sellController = TextEditingController();

  @override
  void initState() {
    super.initState();
    buyController.text = widget.currency.buyPrice.toString();
    sellController.text = widget.currency.sellPrice.toString();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UpdateCurrenciesCubit, UpdateCurrenciesState>(
      listener: (context, state) {
        if (state is UpdateCurrenciesLoading) {
          showLoadingDialog(context, message: 'جاري تحديث سعر العملة');
        } else if (state is UpdateCurrenciesFailed) {
          Navigator.pop(context);
          showAlertDialog(context, 'فشل تحديث سعر العملة');
        } else {
          Navigator.pop(context);
          showAlertDialog(context, 'تم تحديث سعر العملة بنجاح');
        }
      },
      child: AlertDialog(
        backgroundColor: white,

        title: Text(
          'تعديل سعر بيع وشراء العملة ${widget.currency.name}',
          style: textTheme(context).bodyLarge!.copyWith(color: Colors.black),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 8,
          children: [
            Text(
              'ادخل سعر الشراء',
              style: textTheme(
                context,
              ).bodyLarge!.copyWith(fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 8),
            AmountEntryField(
              controller: buyController,

              hintText: 'ادخل سعر شراء ${widget.currency.name}',
            ),
            Text(
              'ادخل سعر المبيع',
              style: textTheme(
                context,
              ).bodyLarge!.copyWith(fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 8),
            AmountEntryField(
              controller: sellController,

              hintText: 'ادخل سعر مبيع ${widget.currency.name}',
            ),
            SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: deepGreen),
              onPressed: () {
                final newSellPrice = parseFormattedNumber(sellController.text);
                final newBuyPrice = parseFormattedNumber(buyController.text);
                context.read<UpdateCurrenciesCubit>().updateCurrencies(
                  widget.currency.id,
                  newSellPrice,
                  newBuyPrice,
                );
              },
              child: Text(
                'تحديث سعر العملة',
                style: textTheme(
                  context,
                ).bodyLarge!.copyWith(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
