import 'package:flutter/material.dart';
import 'package:taima_calculator/source/colors.dart';
import 'package:taima_calculator/source/theme.dart';

enum SellBuyType { sell, buy }

class SellBuyBox extends StatelessWidget {
  const SellBuyBox({super.key, required this.type, required this.notifier});
  final SellBuyType type;
  final ValueNotifier<SellBuyType> notifier;

  Color get bgColor {
    if (notifier.value == SellBuyType.buy && type == SellBuyType.buy) {
      return deepGreen;
    } else if (notifier.value == SellBuyType.sell && type == SellBuyType.sell) {
      return Colors.red;
    } else {
      return white;
    }
  }

  Color get fgColor {
    if (notifier.value == type) {
      return white;
    } else {
      return Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        notifier.value = type;
      },
      child: Container(
        height: MediaQuery.sizeOf(context).height * 0.1,
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.black)),
          color: bgColor,
        ),

        child: Center(
          child: Text(
            type == SellBuyType.sell ? 'بيع' : 'شراء',
            style: textTheme(
              context,
            ).bodyLarge!.copyWith(fontWeight: FontWeight.w700, color: fgColor),
          ),
        ),
      ),
    );
  }
}

class SellBuyButtons extends StatefulWidget {
  const SellBuyButtons({super.key, required this.notifier});
  final ValueNotifier<SellBuyType> notifier;

  @override
  State<SellBuyButtons> createState() => _SellBuyButtonsState();
}

class _SellBuyButtonsState extends State<SellBuyButtons> {
  @override
  void initState() {
    super.initState();
    widget.notifier.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: SellBuyBox(type: SellBuyType.buy, notifier: widget.notifier),
        ),
        Expanded(
          child: SellBuyBox(type: SellBuyType.sell, notifier: widget.notifier),
        ),
      ],
    );
  }
}
