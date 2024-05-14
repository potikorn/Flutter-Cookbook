import 'package:flutter/material.dart';
import 'package:cookbook/simplelist.dart';
import 'basiclist.dart';
import 'horizontallist.dart';
import 'gridlist.dart';
import 'differenttype.dart';
import 'longlist.dart';

void main() => runApp(MainListMenu());

class MainListMenu extends StatelessWidget {
  final _listMenu = [
    'Basic List',
    'Create a horizontal list',
    'Creating a Grid List',
    'Creating lists with different types of items',
    'Working with long lists',
  ];
  final title = "List";

  void onTapMenu(BuildContext context, int index) {
    Widget? navigatorWidget;
    switch (index) {
      case 0:
        navigatorWidget = BasicListDemo();
        break;
      case 1:
        navigatorWidget = HorizontalListDemo();
        break;
      case 2:
        navigatorWidget = GridListDemo();
        break;
      case 3:
        navigatorWidget = DifferentTypeDemo();
        break;
      case 4:
        navigatorWidget = LongListDemo();
        break;
    }
    if (navigatorWidget != null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => navigatorWidget!),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SimpleList(list: _listMenu, onTapAction: onTapMenu),
    );
  }
}
