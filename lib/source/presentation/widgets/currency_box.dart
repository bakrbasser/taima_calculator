import 'package:flutter/material.dart';
import 'package:taima_calculator/source/colors.dart';
import 'package:taima_calculator/source/domain/currency.dart';
import 'package:taima_calculator/source/presentation/cubit/currencies_list/currencies_list_cubit.dart';
import 'package:taima_calculator/source/presentation/pages/update_currencies_price_page.dart';
import 'package:taima_calculator/source/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrencyBox extends StatefulWidget {
  const CurrencyBox({
    super.key,
    required this.currency,
    required this.selectedCurrencyId,
  });
  final Currency currency;
  final ValueNotifier<int> selectedCurrencyId;

  @override
  State<CurrencyBox> createState() => _CurrencyBoxState();
}

class _CurrencyBoxState extends State<CurrencyBox> {
  @override
  void initState() {
    super.initState();
    widget.selectedCurrencyId.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.selectedCurrencyId.value = widget.currency.id;
      },
      onLongPress: () {
        showDialog(
          context: context,
          builder: (context) =>
              UpdateCurrenciesPricePage(currency: widget.currency),
        );
      },
      child: Container(
        constraints: BoxConstraints(
          minWidth: MediaQuery.sizeOf(context).width * 0.08,
        ),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 2),
          borderRadius: BorderRadius.circular(25),
          color: widget.selectedCurrencyId.value == widget.currency.id
              ? navyBlue
              : Colors.white,
        ),

        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text(
              widget.currency.name,
              style: textTheme(context).bodyLarge!.copyWith(
                fontWeight: FontWeight.w700,
                fontSize: 12,

                color: widget.selectedCurrencyId.value == widget.currency.id
                    ? white
                    : Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CurrenciesList extends StatefulWidget {
  const CurrenciesList({
    super.key,
    required this.selectedCurrencyId,
    required this.currencies,
  });
  final ValueNotifier<int> selectedCurrencyId;
  final List<Currency> currencies;

  @override
  State<CurrenciesList> createState() => _CurrenciesListState();
}

class _CurrenciesListState extends State<CurrenciesList> {
  void onCurrencyTap(int id, int index) {
    setState(() {
      widget.selectedCurrencyId.value = id;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.058,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          for (int index = 0; index < widget.currencies.length; index++)
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: CurrencyBox(
                currency: widget.currencies[index],
                selectedCurrencyId: widget.selectedCurrencyId,
              ),
            ),
        ],
      ),
    );
  }
}

class CurrenciesListWithBlocBuilder extends StatefulWidget {
  const CurrenciesListWithBlocBuilder({
    super.key,
    required this.selectedCurrencyId,
  });
  final ValueNotifier<int> selectedCurrencyId;

  @override
  State<CurrenciesListWithBlocBuilder> createState() =>
      _CurrenciesListWithBlocBuilderState();
}

class _CurrenciesListWithBlocBuilderState
    extends State<CurrenciesListWithBlocBuilder> {
  @override
  void initState() {
    super.initState();
    context.read<CurrenciesListCubit>().fetchCurrencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrenciesListCubit, CurrenciesListState>(
      builder: (context, state) {
        if (state is CurrenciesListLoading) {
          return CircularProgressIndicator();
        } else if (state is CurrenciesListLoaded) {
          return CurrenciesList(
            selectedCurrencyId: widget.selectedCurrencyId,
            currencies: state.currencies,
          );
        } else if (state is CurrenciesListError) {
          return Text(
            state.message,
            style: textTheme(context).bodyLarge!.copyWith(color: Colors.red),
          );
        } else {
          return SizedBox();
        }
      },
    );
  }
}
