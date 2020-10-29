library tutorial;

import 'package:flutter/material.dart';
import 'package:tutorial/painter/painter.dart';

import 'models/tutorial_itens.dart';
export './tutorial.dart';
export './models/shape_models.dart';
export './models/tutorial_itens.dart';

class Tutorial {
  static showTutorial(
      BuildContext context, List<TutorialItens> children) async {
    int count = 0;
    var size = MediaQuery.of(context).size;
    OverlayState overlayState = Overlay.of(context);
    List<OverlayEntry> entrys = [];
    children.forEach((element) async {
      var offset = _capturePositionWidget(element.globalKey);
      var sizeWidget = _getSizeWidget(element.globalKey);
      entrys.add(
        OverlayEntry(
          builder: (context) {
            return Scaffold(
              backgroundColor: Colors.transparent,
              body: Stack(
                children: [
                  CustomPaint(
                    size: size,
                    painter: HolePainter(
                      shapeFocus: element.shapeFocus,
                      dx: offset.dx + (sizeWidget.width / 2),
                      dy: offset.dy + (sizeWidget.height / 2),
                      radius: sizeWidget.width < sizeWidget.height
                          ? sizeWidget.height
                          : sizeWidget.width,
                    ),
                  ),
                  ...element.children,
                  Align(
                    alignment: element.alignmentWidgetNextFocus ??
                        Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: GestureDetector(
                        child: element.clicknextFocusWidget ??
                            Text(
                              "NEXT",
                              style: TextStyle(color: Colors.white),
                            ),
                        onTap: () {
                          entrys[count].remove();
                          count++;
                          if (count != entrys.length) {
                            overlayState.insert(entrys[count]);
                          }
                        },
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      );
    });

    overlayState.insert(entrys[0]);
  }

  static Offset _capturePositionWidget(GlobalKey key) {
    RenderBox renderPosition = key.currentContext.findRenderObject();

    return renderPosition.localToGlobal(Offset.zero);
  }

  static Size _getSizeWidget(GlobalKey key) {
    RenderBox renderSize = key.currentContext.findRenderObject();
    return renderSize.size;
  }
}
