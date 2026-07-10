import 'package:flutter/material.dart';

class ComboBoxItem<T>
    extends StatelessWidget {
  const ComboBoxItem({
    super.key,
    required this.item,
    required this.title,
    required this.selected,
    required this.highlighted,
    required this.onTap,
  });

  final T item;

  final String title;

  final bool selected;

  final bool highlighted;

  final VoidCallback onTap;

  @override
  Widget build(
      BuildContext context,
      ) {
    Color? background;

    if (highlighted) {
      background =
          Colors.blue.shade50;
    } else if (selected) {
      background =
          Colors.grey.shade100;
    }

    return InkWell(
      onTap: onTap,
      child: Container(
        height: 48,
        color: background,
        padding:
        const EdgeInsets.symmetric(
          horizontal: 12,
        ),
        alignment:
        Alignment.centerLeft,
        child: Text(title),
      ),
    );
  }
}