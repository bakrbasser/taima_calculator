import 'package:flutter/material.dart';
import 'package:taima_calculator/source/colors.dart';
import 'package:taima_calculator/source/theme.dart';

class LoadingDialog extends StatelessWidget {
  final String message;

  const LoadingDialog({this.message = 'جاري التحميل...', super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircularProgressIndicator(),
            Spacer(),
            Flexible(
              child: Text(
                message,
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

void showLoadingDialog(
  BuildContext context, {
  String message = 'جاري التحميل...',
}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) => LoadingDialog(message: message),
  );
}

Future<void> showAlertDialog(
  BuildContext context,
  String message, {
  bool dismissible = true,
  String okMessage = 'خسنا',
  VoidCallback? onOk,
}) async {
  await showDialog(
    barrierDismissible: dismissible,
    context: context,
    builder: (context) => AlertDialog(
      content: Text(
        message,
        style: textTheme(context).bodyLarge!.copyWith(color: white),
      ),
      actions: [
        TextButton(
          onPressed: () {
            if (onOk != null) {
              onOk();
            }
            Navigator.pop(context);
          },
          child: Text(
            okMessage,
            style: textTheme(context).bodyLarge!.copyWith(color: Colors.white),
          ),
        ),
      ],
    ),
  );
}

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: textTheme(context).bodyLarge!.copyWith(color: Colors.white),
      ),
    ),
  );
}
