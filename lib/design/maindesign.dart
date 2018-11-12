import 'package:flutter/material.dart';
import 'adddrawer.dart';
import 'displayingsnackbar.dart';
import 'updateorientation.dart';
import 'customtheme.dart';
import 'tabbar.dart';

void main() => runApp(MainDesignMenu());

class MainDesignMenu extends StatelessWidget {
  final _designMenu = [
    'Add a Drawer to a screen',
    'Displaying Snackbars',
    'Updating the UI based on orientation',
    'Using Themes to share colors and font styles',
    'Working with Tabs',
  ];
  final title = "Design";

  void onTapMenu(BuildContext context, int index) {
    print(index);
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
        navigatorWidget = CustomThemeDemo();
        break;
      case 4:
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
    return MaterialApp(
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView.builder(
          padding: EdgeInsets.all(16.0),
          itemCount: _designMenu.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () => onTapMenu(context, index),
              child: Card(
                child: Container(
                  padding: EdgeInsets.only(
                      top: 24.0, right: 16.0, bottom: 24.0, left: 16.0),
                  child: Center(
                    child: Text(_designMenu[index]),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
