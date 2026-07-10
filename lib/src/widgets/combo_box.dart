import 'package:flutter/material.dart';

import '../controllers/single_select_controller.dart';
import '../core/combo_box_state.dart';
import '../keyboard/keyboard_handler.dart';
import '../keyboard/keyboard_navigation.dart';
import '../models/typedefs.dart';
import '../overlay/combo_box_overlay.dart';
import '../search/search_controller.dart';
import '../search/local_search.dart';
import 'combo_box_input.dart';
import 'combo_box_list.dart';

class ComboBox<T> extends StatefulWidget {
  const ComboBox({
    super.key,
    required this.items,
    required this.displayText,
    this.onChanged,
    this.itemBuilder,
    this.hintText = 'Select',
  });

  final List<T> items;

  final DisplayText<T> displayText;

  final ValueChanged<T?>? onChanged;

  final ItemBuilder<T>? itemBuilder;

  final String hintText;

  @override
  State<ComboBox<T>> createState() =>
      _ComboBoxState<T>();
}

class _ComboBoxState<T>
    extends State<ComboBox<T>> {
  late ComboBoxState<T> state;

  late SearchControllerCustom<T>
  searchController;

  final navigation =
  KeyboardNavigation();

  final controller =
  SingleSelectController<T>();

  late KeyboardHandler<T>
  keyboardHandler;

  @override
  void initState() {
    super.initState();

    state = ComboBoxState<T>();

    state.filteredItems =
        List.from(widget.items);

    searchController =
        SearchControllerCustom<T>(
          engine: LocalSearch<T>(
            items: widget.items,
            displayText:
            widget.displayText,
          ),
        );

    state.textController
        .addListener(_search);

    keyboardHandler =
        KeyboardHandler<T>(
          navigation: navigation,
          items: () =>
          state.filteredItems,
          scrollController:
          state.scrollController,
          onSelected:
          _selectItem,
          onClose:
          _closeDropdown,
          onRefresh: () {
            state.overlayManager
                .rebuild();
          },
        );
  }

  Future<void> _search() async {
    await searchController.search(
      keyword:
      state.textController.text,
      onResult: (result) {
        state.filteredItems =
            result;

        if (mounted) {
          setState(() {});
        }

        state.overlayManager
            .rebuild();
      },
    );
  }

  void _openDropdown() {
    if (state.overlayManager
        .isShowing) {
      return;
    }

    final renderBox =
    context.findRenderObject()
    as RenderBox;

    final overlay =
    ComboBoxOverlay(
      context: context,
      layerLink:
      state.layerLink,
      overlayManager:
      state.overlayManager,
    );

    final entry =
    overlay.create(
      target: renderBox,
      child: SizedBox(
        height: 300,
        child:
        ComboBoxList<T>(
          items:
          state.filteredItems,
          displayText:
          widget.displayText,
          highlightedIndex:
          navigation
              .highlightedIndex,
          selectedItem:
          controller.value,
          itemBuilder:
          widget.itemBuilder,
          onSelected:
          _selectItem,
          scrollController:
          state
              .scrollController,
        ),
      ),
    );

    state.overlayManager.show(
      context,
      entry,
    );
  }

  void _closeDropdown() {
    state.overlayManager.hide();
  }

  void _selectItem(T item) {
    controller.select(item);

    widget.onChanged?.call(item);

    state.textController.text =
        widget.displayText(item);

    _closeDropdown();

    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(
      BuildContext context,
      ) {
    return Focus(
      onKeyEvent:
      keyboardHandler.handle,
      child:
      CompositedTransformTarget(
        link:
        state.layerLink,
        child: ComboBoxInput(
          controller:
          state.textController,
          focusNode:
          state.focusNode,
          hintText:
          widget.hintText,
          onTap:
          _openDropdown,
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