// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:agendei/main.dart';
import 'package:agendei/wave_ds/components/calendar_cell.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  final widget = MyApp();
  debugPaintLayerBordersEnabled = true;
  // debugPaintBaselinesEnabled = true;
  debugRepaintRainbowEnabled = true;
  testWidgets('dump widget tree: ShaderMask()', (WidgetTester tester) async {
    await tester.pumpWidget(widget);
    final rootElement = WidgetsBinding.instance.renderViewElement;
    
    printAllSomaElement(rootElement!, Counter());

    await expectLater(find.byType(MyApp),
                      matchesGoldenFile('main.png'));
                      
  });
}

extension _ElementExt on Element {
  List<Element> get children {
    List<Element> _children = <Element>[];
    visitChildElements((Element element) => _children.add(element));
    return _children;
  }
}

class Counter {
  var count = 0;
  void add() => count += 1;
}

void printAllSomaElement(Element e, Counter normal) {
  printConditional(e, normal);

  if (e.children.isEmpty) {
    return;
  }
  for (var element in e.children) {
    if (element.toStringShort() == 'CalendarCell') {
      // element.renderObject!.;
      element.renderObject!.debugRegisterRepaintBoundaryPaint();
      debugPrint(' AQUIII ${element.renderObject?.paintBounds}');
      return;
    }

    printAllSomaElement(element, normal);
  }
}
class LinePainter extends RenderBox {
  @override
  void paint(PaintingContext context, Offset offset) {
    debugPrint('LETTT GOOO ${context.estimatedBounds}');
    super.paint(context, offset);
  }
  
}


void printConditional(Element e, Counter normal) {
  if (e.runtimeType == StatelessElement) {
    normal.add();
    debugPrint('Reader Bot ${e.widget.toStringShort()} ${normal.count}');
  }
}