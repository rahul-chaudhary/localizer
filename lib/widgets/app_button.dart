import 'package:flutter/material.dart';
import '../utils/constants/app_color.dart';

class AppButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  const AppButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          minimumSize: WidgetStateProperty.all(const Size(100, 50)),
          backgroundColor: WidgetStateProperty.all(AppColor.primaryColor),
          foregroundColor: WidgetStateProperty.all(AppColor.scaffoldColorLight),
          shape: WidgetStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
        ),
        child: Text(text));
  }
}
