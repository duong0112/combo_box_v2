class ComboBoxItemModel<T> {
  final T value;

  final String label;

  final bool enabled;

  const ComboBoxItemModel({
    required this.value,
    required this.label,
    this.enabled = true,
  });

  @override
  bool operator ==(Object other) {
    if (other is! ComboBoxItemModel<T>) {
      return false;
    }

    return value == other.value;
  }

  @override
  int get hashCode => value.hashCode;
}
