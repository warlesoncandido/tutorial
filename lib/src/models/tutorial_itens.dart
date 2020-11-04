import 'package:flutter/material.dart';
import 'package:tutorial/src/models/shape_models.dart';

class TutorialItens {
  GlobalKey globalKey;
  ShapeFocus shapeFocus;
  final List<Positioned> children;
  final Alignment alignmentWidgetNextFocus;
  final Widget clicknextFocusWidget;

  TutorialItens({
    this.globalKey,
    this.children,
    this.alignmentWidgetNextFocus,
    this.shapeFocus,
    this.clicknextFocusWidget,
  });
}
