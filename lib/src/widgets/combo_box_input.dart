import 'package:flutter/material.dart';

class ComboBoxInput extends StatelessWidget {
  const ComboBoxInput({super.key, required this.controller, required this.focusNode, required this.hintText, required this.border, required this.borderFocus});

  final TextEditingController controller;
  final FocusNode focusNode;
  final String hintText;
  final InputBorder? border;
  final InputBorder? borderFocus;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      focusNode: focusNode,
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: const Icon(Icons.arrow_drop_down),
        border: border,
        enabledBorder: border,
        focusedBorder: borderFocus??border,
      ),
    );
  }
}
