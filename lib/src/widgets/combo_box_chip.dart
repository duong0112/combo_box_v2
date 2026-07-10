import 'package:flutter/material.dart';

class ComboBoxChip
    extends StatelessWidget {
  const ComboBoxChip({
    super.key,
    required this.label,
    required this.onDeleted,
  });

  final String label;

  final VoidCallback onDeleted;

  @override
  Widget build(
      BuildContext context,
      ) {
    return Chip(
      label: Text(label),
      onDeleted: onDeleted,
    );
  }
}