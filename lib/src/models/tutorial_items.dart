import 'package:flutter/material.dart';
import 'package:tutorial/src/models/shape_models.dart';

class TutorialItems {
  final GlobalKey? globalKey;
  final ShapeFocus? shapeFocus;
  final List<Widget>? children;
  final double? top;
  final double? bottom;
  final double? left;
  final double? right;
  final double? radius;
  final double? width;
  final double? height;
  final Widget? widgetNext;
  final Widget? widgetSkip;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisAlignment mainAxisAlignment;
  final bool touchScreen;
  final Function? onTap;

  TutorialItems(
      {this.top,
      this.bottom,
      this.left,
      this.right,
      this.radius,
      this.width,
      this.height,
      this.globalKey,
      this.children,
      this.shapeFocus,
      this.crossAxisAlignment = CrossAxisAlignment.center,
      this.mainAxisAlignment = MainAxisAlignment.center,
      this.widgetNext,
      this.touchScreen = false,
      this.widgetSkip,
      this.onTap});
}
