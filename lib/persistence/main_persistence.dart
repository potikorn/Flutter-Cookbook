import 'package:flutter/material.dart';
import 'package:cookbook/simplelist.dart';
import 'read_and_write_file.dart';
import 'store_data_on_disk.dart';

class MainPersistenceMenu extends StatelessWidget {
  final _simpleMenu = [
    'Reading and Writing Files',
    'Storing key-value data on disk',
  ];
  final title = "Networking";

  void onTapMenu(BuildContext context, int index) {
    Widget navigatorWidget;
    switch (index) {
      case 0:
        navigatorWidget = ReadAndWriteFileDemo();
        break;
      case 1:
        navigatorWidget = StoreDataOnDiskDemo();
        break;
      // case 2:
      //   navigatorWidget = ParsingInBackgroundDemo();
      //   break;
      // case 3:
      //   navigatorWidget = WebSocketDemo();
      //   break;
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
      body: SimpleList(list: _simpleMenu, onTapAction: onTapMenu),
    );
  }
}

