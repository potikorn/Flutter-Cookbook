import 'package:flutter/material.dart';
import 'package:cookbook/simplelist.dart';
import 'material_touch_ripple.dart';
import 'handle_taps.dart';
import 'swipe_to_dismiss.dart';

void main() => runApp(MainGesturesMenu());

class MainGesturesMenu extends StatelessWidget {
  final _gesturesMenu = [
    'Adding Material Touch Ripples',
    'Handling Taps',
    'Implement Swipe to Dismiss',
  ];
  final title = "Gestures";

  void onTapMenu(BuildContext context, int index) {
    print(index);
    Widget navigatorWidget;
    switch (index) {
      case 0:
        navigatorWidget = MaterialTouchRipple();
        break;
      case 1:
        navigatorWidget = HandleTapsDemo();
        break;
      case 2:
        navigatorWidget = SwipeToDismissDemo();
        break;
    }
    if (navigatorWidget != null) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => navigatorWidget));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SimpleList(list: _gesturesMenu, onTapAction: onTapMenu),
    );
  }
}
