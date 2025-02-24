import 'package:flutter/material.dart';

TextField myTextField({required String hintText, required TextEditingController controller, bool autocorrect = false}) {
  return TextField(
    controller: controller,
    autocorrect: autocorrect,
    decoration: InputDecoration(
      hintText: hintText,
      border: const OutlineInputBorder(),
    ),
  );
}