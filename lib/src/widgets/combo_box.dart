import 'package:flutter/material.dart';

import '../controllers/single_select_controller.dart';
import '../core/combo_box_state.dart';
import '../keyboard/keyboard_handler.dart';
import '../keyboard/keyboard_navigation.dart';
import '../models/combo_box_item_model.dart';
import '../models/typedefs.dart';
import '../overlay/combo_box_overlay.dart';
import '../search/search_controller.dart';
import '../search/local_search.dart';
import 'combo_box_input.dart';
import 'combo_box_list.dart';

class ComboBox extends StatefulWidget {
  const ComboBox({
    super.key,
    required this.items,
    required this.displayText,
    this.valueSelected,
    this.textStyle,
    this.textStyleSelected,
    this.bgColorSelected,
    this.onChanged,
    this.itemBuilder,
    this.hintText = 'Select',
    this.border,
    this.borderFocus,
    this.heightItem = 48,
    this.numberItemShow = 5,
  });

  final List<ComboBoxItemModel> items;

  final DisplayText<ComboBoxItemModel> displayText;

  final ValueChanged<ComboBoxItemModel?>? onChanged;

  final ItemBuilder<ComboBoxItemModel>? itemBuilder;

  final String hintText;

  final TextStyle? textStyle;

  final TextStyle? textStyleSelected;

  final Color? bgColorSelected;

  final int? valueSelected;

  final InputBorder? border;

  final InputBorder? borderFocus;

  final double heightItem;

  final int numberItemShow;

  @override
  State<ComboBox> createState() => _ComboBoxState();
}

class _ComboBoxState extends State<ComboBox> {
  late ComboBoxState state;

  late SearchControllerCustom searchController;

  final navigation = KeyboardNavigation();

  final controller = SingleSelectController();

  late KeyboardHandler keyboardHandler;

  int? valueSelected;

  @override
  void initState() {
    super.initState();

    state = ComboBoxState();
    final engine = LocalSearch(items: widget.items, displayText: widget.displayText);
    state.focusNode.addListener(() {
      if (state.focusNode.hasFocus) {
        _openDropdown();
      }
    });
    valueSelected = widget.valueSelected;
    state.filteredItems = List.from(widget.items);

    searchController = SearchControllerCustom(engine: engine);

    state.textController.addListener(() => _search(engine));

    keyboardHandler = KeyboardHandler(
      navigation: navigation,
      items: () => state.filteredItems,
      scrollController: state.scrollController,
      onSelected: _selectItem,
      onClose: _closeDropdown,
      onRefresh: () {
        state.overlayManager.rebuild();
      },
    );
  }

  Future<void> _search(LocalSearch engine) async {
    state.filteredItems = await engine.search(state.textController.text);
    if (mounted) {
      setState(() {});
      state.overlayManager.rebuild();
    }
  }

  void _openDropdown() {
    if (state.overlayManager.isShowing) {
      return;
    }

    final renderBox = context.findRenderObject() as RenderBox;

    final overlay = ComboBoxOverlay(
      context: context,
      layerLink: state.layerLink,
      overlayManager: state.overlayManager,
    );

    final entry = overlay.create(
      target: renderBox,
      height: widget.heightItem * widget.numberItemShow,
      overlayBuilder: () {
        return ComboBoxList(
          items: state.filteredItems,
          displayText: widget.displayText,
          textStyle: widget.textStyle,
          textStyleSelected: widget.textStyleSelected,
          highlightedIndex: navigation.highlightedIndex,
          bgColorSelected: widget.bgColorSelected,
          valueSelected: valueSelected,
          itemBuilder: widget.itemBuilder,
          onSelected: _selectItem,
          scrollController: state.scrollController,
          heightItem: widget.heightItem,
        );
      },
    );

    state.overlayManager.show(context, entry);
  }

  void _closeDropdown() {
    state.overlayManager.hide();
  }

  void _selectItem(ComboBoxItemModel item) {
    controller.select(item);

    widget.onChanged?.call(item);

    state.textController.text = widget.displayText(item);

    valueSelected = item.value;

    _closeDropdown();

    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      onKeyEvent: keyboardHandler.handle,
      child: CompositedTransformTarget(
        link: state.layerLink,
        child: ComboBoxInput(
          controller: state.textController,
          focusNode: state.focusNode,
          hintText: widget.hintText,
          border: widget.border,
          borderFocus: widget.borderFocus,
        ),
      ),
    );
  }

  @override
  void dispose() {
    searchController.dispose();

    state.dispose();

    super.dispose();
  }
}
