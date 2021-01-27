import 'package:cookbook/design/use_custom_font.dart';
import 'package:flutter/material.dart';

import '../simplelist.dart';
import 'add_drawer.dart';
import 'custom_theme.dart';
import 'displaying_snackbar.dart';
import 'tab_bar.dart';
import 'update_orientation.dart';

void main() => runApp(MainDesignMenu());

class MainDesignMenu extends StatelessWidget {
  final _designMenu = [
    'Add a Drawer to a screen',
    'Displaying Snackbars',
    'Updating the UI based on orientation',
    'Use a custom font',
    'Using Themes to share colors and font styles',
    'Working with Tabs',
  ];
  final title = "Design";

  void onTapMenu(BuildContext context, int index) {
    Widget navigatorWidget;
    switch (index) {
      case 0:
        navigatorWidget = AddDrawer();
        break;
      case 1:
        navigatorWidget = SnackBarDemo();
        break;
      case 2:
        navigatorWidget = OreintationDemo();
        break;
      case 3:
        navigatorWidget = UseCustomFont();
        break;
      case 4:
        navigatorWidget = CustomThemeDemo();
        break;
      case 5:
        navigatorWidget = TabBarDemo();
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
      body: SimpleList(list: _designMenu, onTapAction: onTapMenu),
    );
  }
}
