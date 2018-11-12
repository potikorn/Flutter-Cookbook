import 'package:flutter/material.dart';
import 'package:cookbook/simplelist.dart';
import 'animatenavigation.dart';

void main() => runApp(MainNavigationMenu());

class MainNavigationMenu extends StatelessWidget {
  final _simpleMenu = [
    'Animating a Widget across screens',
    // 'Create a horizontal list',
    // 'Creating a Grid List',
    // 'Creating lists with different types of items',
    // 'Working with long lists',
  ];
  final title = "Navigation";

  void onTapMenu(BuildContext context, int index) {
    print(index);
    Widget navigatorWidget;
    switch (index) {
      case 0:
        navigatorWidget = AnimateNavigationDemo();
        break;
      // case 1:
      //   navigatorWidget = HorizontalListDemo();
      //   break;
      // case 2:
      //   navigatorWidget = GridListDemo();
      //   break;
      // case 3:
      //   navigatorWidget = DifferentTypeDemo();
      //   break;
      // case 4:
      //   navigatorWidget = LongListDemo();
      //   break;
    }
    if (navigatorWidget != null) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => navigatorWidget));
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text(title),
          ),
          body: SimpleList(list: _simpleMenu, onTapAction: onTapMenu)),
    );
  }
}
