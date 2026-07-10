import 'package:flutter/material.dart';

class ComboBoxInput
    extends StatelessWidget {
  const ComboBoxInput({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.onTap,
    required this.hintText,
  });

  final TextEditingController
  controller;

  final FocusNode focusNode;

  final VoidCallback onTap;

  final String hintText;

  @override
  Widget build(
      BuildContext context,
      ) {
    return TextField(
      controller: controller,
      focusNode: focusNode,
      onTap: onTap,
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: const Icon(
          Icons.arrow_drop_down,
        ),
        border:
        const OutlineInputBorder(),
      ),
    );
  }
}