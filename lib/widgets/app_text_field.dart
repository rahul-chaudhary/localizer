import 'package:flutter/material.dart';

TextField myTextField({required String hintText, required TextEditingController controller}) {
  return TextField(
    controller: controller,
    decoration: InputDecoration(
      hintText: hintText,
      border: const OutlineInputBorder(),
    ),
  );
}