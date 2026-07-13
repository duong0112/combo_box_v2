import 'package:flutter/material.dart';

import '../models/combo_box_item_model.dart';
import 'overlay_manager.dart';

class ComboBoxState {
  final LayerLink layerLink = LayerLink();

  final FocusNode focusNode =
  FocusNode();

  final FocusNode searchFocusNode =
  FocusNode();

  final TextEditingController
  textController =
  TextEditingController();

  final ScrollController
  scrollController =
  ScrollController();

  final OverlayManager
  overlayManager =
  OverlayManager();

  List<ComboBoxItemModel> filteredItems = [];

  bool loading = false;

  bool isOpen = false;

  void dispose() {
    overlayManager.hide();

    focusNode.dispose();

    searchFocusNode.dispose();

    textController.dispose();

    scrollController.dispose();
  }
}