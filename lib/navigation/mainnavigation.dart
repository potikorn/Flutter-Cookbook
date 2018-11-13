import 'package:flutter/material.dart';
import 'package:cookbook/simplelist.dart';
import 'animatenavigation.dart';
import 'navigatenewdemo.dart';
import 'navigate_with_named_route.dart';
import 'returning_data.dart';
import 'send_data_to_new_screen.dart';

class MainNavigationMenu extends StatelessWidget {
  final _navigationMenu = [
    'Animating a Widget across screens',
    'Navigate to a new screen and back',
    'Navigate with named routes',
    'Return data from a screen',
    'Send data to a new screen',
  ];
  final title = "Navigation";

  void onTapMenu(BuildContext context, int index) {
    Widget navigatorWidget;
    switch (index) {
      case 0:
        navigatorWidget = AnimateNavigationDemo();
        break;
      case 1:
        navigatorWidget = NavigateDemo();
        break;
      case 2:
        navigatorWidget = NavigateWithNamedRouteDemo();
        break;
      case 3:
        navigatorWidget = ReturnDataDemo();
        break;
      case 4:
        navigatorWidget = SendDataToNewScreenDemo();
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
      body: SimpleList(list: _navigationMenu, onTapAction: onTapMenu),
    );
  }
}
