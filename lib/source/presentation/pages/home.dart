import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taima_calculator/source/colors.dart';
import 'package:taima_calculator/source/presentation/cubit/currencies_list/currencies_list_cubit.dart';
import 'package:taima_calculator/source/presentation/widgets/amount_entry_field.dart';
import 'package:taima_calculator/source/presentation/widgets/currency_box.dart';
import 'package:taima_calculator/source/presentation/widgets/selected_currency_price.dart';
import 'package:taima_calculator/source/presentation/widgets/sell_buy_box.dart';
import 'package:taima_calculator/source/theme.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ValueNotifier<int> selectedCurrencyId = ValueNotifier<int>(1);
  final ValueNotifier<SellBuyType> sellBuyNotifier = ValueNotifier<SellBuyType>(
    SellBuyType.buy,
  );
  final TextEditingController amountController = TextEditingController();

  @override
  void initState() {
    super.initState();
    sellBuyNotifier.addListener(() {
      setState(() {});
    });
  }

  Color get bgColor {
    if (sellBuyNotifier.value == SellBuyType.buy) {
      return const Color.fromARGB(225, 245, 248, 247);
    } else {
      return deepGreen;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(title: Text('حاسبة عملات تيما')),
      // HomeNavigationRails(),
      // SizedBox(width: MediaQuery.of(context).size.width * 0.15),
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.6,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SellBuyButtons(notifier: sellBuyNotifier),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 32),
                      Text(
                        'اختر العملة المراد تصريفها',
                        style: textTheme(
                          context,
                        ).bodyLarge!.copyWith(fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 8),
                      CurrenciesListWithBlocBuilder(
                        selectedCurrencyId: selectedCurrencyId,
                      ),
                      SizedBox(height: 32),
                      Text(
                        'ادخل المبلغ المراد تصريفه',
                        style: textTheme(
                          context,
                        ).bodyLarge!.copyWith(fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 8),
                      AmountEntryField(
                        controller: amountController,

                        hintText:
                            'ادخل المبلغ المراد تحويله الى الليرة السورية',
                      ),
                      SizedBox(height: 32),
                      SelectedCurrencyPrice(
                        selectedCurrencyId: selectedCurrencyId,
                        sellBuyNotifier: sellBuyNotifier,
                      ),
                      SizedBox(height: 32),

                      Center(
                        child: TheResultOfCalculation(
                          selectedCurrencyId: selectedCurrencyId,
                          sellBuyNotifier: sellBuyNotifier,
                          amountController: amountController,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HomeNavigationRails extends StatefulWidget {
  const HomeNavigationRails({super.key});

  @override
  State<HomeNavigationRails> createState() => _HomeNavigationRailsState();
}

class _HomeNavigationRailsState extends State<HomeNavigationRails> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.15,
      child: NavigationRail(
        leading: Image.asset(
          'assets/images/taima_logo.png',
          fit: BoxFit.fitWidth,
        ),
        backgroundColor: deepGreen,
        indicatorColor: Colors.white,

        selectedIconTheme: const IconThemeData(color: deepGreen),
        unselectedIconTheme: const IconThemeData(color: Colors.white),
        destinations: const [
          NavigationRailDestination(
            icon: Icon(Icons.attach_money_sharp),
            label: Text('Home'),
          ),
          NavigationRailDestination(
            icon: Icon(Icons.price_change),
            label: Text('Settings'),
          ),
        ],
        selectedIndex: 0,
      ),
    );
  }
}

class TheResultOfCalculation extends StatefulWidget {
  const TheResultOfCalculation({
    super.key,
    required this.selectedCurrencyId,
    required this.sellBuyNotifier,
    required this.amountController,
  });
  final ValueNotifier<int> selectedCurrencyId;
  final ValueNotifier<SellBuyType> sellBuyNotifier;
  final TextEditingController amountController;

  @override
  State<TheResultOfCalculation> createState() => _TheResultOfCalculationState();
}

class _TheResultOfCalculationState extends State<TheResultOfCalculation> {
  String result = '0';

  void get calculateResult {
    setState(() {
      if (widget.amountController.text.isEmpty) {
        result = '0';
      } else {
        double price = 0;
        final selectedCurrency = context
            .read<CurrenciesListCubit>()
            .getCurrencyAccordingToId(widget.selectedCurrencyId.value);
        if (widget.sellBuyNotifier.value == SellBuyType.buy) {
          price =
              selectedCurrency.buyPrice *
              parseFormattedNumber(widget.amountController.text);
        } else {
          price =
              selectedCurrency.sellPrice *
              parseFormattedNumber(widget.amountController.text);
        }
        result = formatNumber(price.toString());
      }
    });
  }

  @override
  void initState() {
    super.initState();
    widget.amountController.addListener(() {
      calculateResult;
    });
    widget.selectedCurrencyId.addListener(() {
      calculateResult;
    });
    widget.sellBuyNotifier.addListener(() {
      calculateResult;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'المبلغ المستحق بالعملة الجديدة',
          style: textTheme(
            context,
          ).bodyLarge!.copyWith(fontWeight: FontWeight.w700, fontSize: 24),
        ),
        SizedBox(height: 8),
        Text(
          formatNumber((parseFormattedNumber(result) / 100).toString()),
          style: textTheme(context).bodyLarge!.copyWith(
            fontWeight: FontWeight.w700,
            fontSize: 32,
            color: Colors.green,
          ),
        ),
        SizedBox(height: 8),
        Text(
          'المبلغ المستحق بالعملة القديمة',
          style: textTheme(
            context,
          ).bodyLarge!.copyWith(fontWeight: FontWeight.w700, fontSize: 24),
        ),
        SizedBox(height: 8),
        Text(
          result,
          style: textTheme(context).bodyLarge!.copyWith(
            fontWeight: FontWeight.w700,
            fontSize: 32,
            color: Colors.red,
          ),
        ),
      ],
    );
  }
}
