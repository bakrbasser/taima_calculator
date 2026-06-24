import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:taima_calculator/source/colors.dart';
import 'package:taima_calculator/source/theme.dart';

class AmountEntryField extends StatefulWidget {
  const AmountEntryField({super.key, this.controller, required this.hintText});

  final TextEditingController? controller;
  final String hintText;

  @override
  State<AmountEntryField> createState() => _AmountEntryFieldState();
}

class _AmountEntryFieldState extends State<AmountEntryField> {
  @override
  @override
  Widget build(BuildContext context) {
    return TextField(
      onTap: () {
        widget.controller!.clear();
      },
      keyboardType: TextInputType.number,
      controller: widget.controller,
      decoration: customInputDecoration(
        borderWidth: 0,
        borderColor: deepGreen,
        hintText: widget.hintText,
        prefix: Icon(Icons.attach_money, color: deepGreen),
        fillColor: Colors.grey.shade200,
        foregroundColor: Colors.black,
      ),
      style: textTheme(
        context,
      ).bodyLarge!.copyWith(color: Colors.black, fontWeight: FontWeight.w700),
      inputFormatters: [MoneyInputFormatter()],
    );
  }
}

InputDecoration customInputDecoration({
  required String hintText,
  Icon? prefix,
  Color? fillColor,
  Color? foregroundColor,
  Color? borderColor,
  double? borderWidth,
  TextStyle? style,
}) {
  final customBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),

    // ignore: deprecated_member_use
    borderSide: BorderSide(
      // ignore: deprecated_member_use
      color: borderColor ?? deepgold.withOpacity(0.6),
      width: borderWidth ?? 1.5,
    ),
  );
  return InputDecoration(
    prefixIcon: prefix,
    hintText: hintText,
    hintStyle: style,
    alignLabelWithHint: false,
    border: customBorder,
    enabledBorder: customBorder,
    focusedBorder: customBorder,
    errorBorder: customBorder.copyWith(
      borderSide: customBorder.borderSide.copyWith(color: Colors.red.shade500),
    ),
    errorStyle: style?.copyWith(color: Colors.red),
    fillColor: fillColor ?? deepGreen,

    filled: true,
  );
}

class MoneyInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.isEmpty) {
      return newValue.copyWith(text: '');
    }

    // Remove all non-digit characters
    String cleanText = newValue.text.replaceAll(RegExp(r'[^\d]'), '');

    if (cleanText.isEmpty) {
      return newValue.copyWith(text: '');
    }

    // Parse to integer and format with commas
    int number = int.parse(cleanText);
    String formatted = NumberFormat('#,###').format(number);

    return newValue.copyWith(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}

String formatNumber(String input) {
  // Remove any non-digit characters EXCEPT decimal point
  String clean = input.replaceAll(RegExp(r'[^\d.]'), '');

  if (clean.isEmpty) {
    return '';
  }

  // Handle numbers with decimal points
  if (clean.contains('.')) {
    // Split into integer and decimal parts
    List<String> parts = clean.split('.');
    String integerPart = parts[0];
    String decimalPart = parts.length > 1 ? parts[1] : '';

    // Format integer part with commas
    if (integerPart.isNotEmpty) {
      int number = int.parse(integerPart);
      integerPart = NumberFormat('#,###').format(number);
    }

    // Check if decimal part is empty or all zeros
    if (decimalPart.isEmpty || int.tryParse(decimalPart) == 0) {
      // Return only the integer part (no decimal point)
      return integerPart;
    } else {
      // Return formatted number with decimal part
      return '$integerPart.$decimalPart';
    }
  } else {
    // Handle whole numbers
    int number = int.parse(clean);
    return NumberFormat('#,###').format(number);
  }
}

double parseFormattedNumber(String formatted) {
  // Remove commas and any non-digit characters except decimal point
  String clean = formatted.replaceAll(RegExp(r'[^\d.]'), '');

  if (clean.isEmpty) {
    return 0.0;
  }

  return double.parse(clean);
}
