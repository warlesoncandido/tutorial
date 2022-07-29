library tutorial;

import 'package:flutter/material.dart';
import 'package:tutorial/src/models/tutorial_items.dart';
import 'package:tutorial/src/painter/painter.dart';

class Tutorial {
  static showTutorial(BuildContext context, List<TutorialItems> children) async {
    int count = 0;
    var size = MediaQuery.of(context).size;
    OverlayState overlayState = Overlay.of(context)!;

    List<OverlayEntry> entrys = [];

    children.forEach((element) async {
      var offset = _capturePositionWidget(element.globalKey!);
      var sizeWidget = _getSizeWidget(element.globalKey!);

      void onNext() {
        entrys[count].remove();
        count++;
        if (count != entrys.length) {
          overlayState.insert(entrys[count]);
        }
      }

      void dismiss() {
        entrys[count].remove();
      }

      entrys.add(
        OverlayEntry(
          builder: (context) {
            var w = element.width == null ? sizeWidget.width : element.width;
            var h = element.height == null ? sizeWidget.height : element.height;

            return GestureDetector(
              onTap: element.touchScreen == true ? () => onNext() : () {},
              child: Scaffold(
                backgroundColor: Colors.transparent,
                body: Stack(
                  children: [
                    InkWell(
                      onTap: () {
                        if (element.onTap != null) {
                          entrys[count].remove();
                          element.onTap!();
                        }
                      },
                      child: CustomPaint(
                        size: size,
                        painter: HolePainter(
                            shapeFocus: element.shapeFocus,
                            dx: offset.dx + (sizeWidget.width / 2),
                            dy: offset.dy + (sizeWidget.height / 2),
                            width: w,
                            height: h,
                            radius: element.radius ?? 0),
                      ),
                    ),
                    Positioned(
                      top: element.top,
                      bottom: element.bottom,
                      left: element.left,
                      right: element.right,
                      child: Container(
                        width: size.width * 0.8,
                        child: Column(
                          crossAxisAlignment: element.crossAxisAlignment,
                          mainAxisAlignment: element.mainAxisAlignment,
                          children: [
                            ...element.children!,
                          ],
                        ),
                      ),
                    ),
                    if (element.widgetNext != null)
                      GestureDetector(
                        onTap: () => onNext(),
                        child: element.widgetNext,
                      ),
                    if (element.widgetSkip != null)
                      GestureDetector(
                        onTap: () => dismiss(),
                        child: element.widgetSkip,
                      )
                  ],
                ),
              ),
            );
          },
        ),
      );
    });

    overlayState.insert(entrys[0]);
  }

  static Offset _capturePositionWidget(GlobalKey key) {
    RenderBox renderPosition = key.currentContext!.findRenderObject() as RenderBox;

    return renderPosition.localToGlobal(Offset.zero);
  }

  static Size _getSizeWidget(GlobalKey key) {
    RenderBox renderSize = key.currentContext!.findRenderObject() as RenderBox;
    return renderSize.size;
  }
}
