class ComboBoxConfig {
  final bool searchable;

  final bool multiSelect;

  final bool closeOnSelect;

  final bool enableKeyboard;

  final bool enableAnimation;

  final bool autoFocusSearch;

  final Duration animationDuration;

  const ComboBoxConfig({
    this.searchable = true,
    this.multiSelect = false,
    this.closeOnSelect = true,
    this.enableKeyboard = true,
    this.enableAnimation = true,
    this.autoFocusSearch = true,
    this.animationDuration =
    const Duration(milliseconds: 200),
  });
}