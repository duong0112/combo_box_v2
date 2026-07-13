class ComboBoxItemModel{
  final int value;

  final String label;

  const ComboBoxItemModel({
    required this.value,
    required this.label,
  });

  @override
  bool operator == (Object other) {
    if (other is! ComboBoxItemModel) {
      return false;
    }

    return value == other.value;
  }

  @override
  int get hashCode => value.hashCode;
}
