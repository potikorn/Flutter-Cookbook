import 'package:flutter/material.dart';
import 'animation/fadeInFadeOut.dart';
import 'design/maindesign.dart';
import 'forms/mainforms.dart';
import 'gestures/maingestures.dart';
import 'images/mainimages.dart';
import 'listdemo/mainlist.dart';
import 'navigation/mainnavigation.dart';

void main() => runApp(MainMenu());

class MainMenu extends StatefulWidget {
  @override
  MainMenuState createState() {
    return new MainMenuState();
  }
}

class MainMenuState extends State<MainMenu> {
  final List<String> _menu = [
    "Animation",
    "Design",
    "Forms",
    "Gestures",
    "Images",
    "List",
    "Navigation",
  ];

  void onMenuTab(int index, BuildContext context) {
    Widget navigateWidget;
    switch (index) {
      case 0:
        navigateWidget = OpacityDemo();
        break;
      case 1:
        navigateWidget = MainDesignMenu();
        break;
      case 2:
        navigateWidget = MainFormMenu();
        break;
      case 3:
        navigateWidget = MainGesturesMenu();
        break;
      case 4:
        navigateWidget = MainImagesMenu();
        break;
      case 5:
        navigateWidget = MainListMenu();
        break;
      case 6:
        navigateWidget = MainNavigationMenu();
        break;
    }
    if (navigateWidget != null) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => navigateWidget));
    }
  }

  @override
  Widget build(BuildContext context) {
    final title = 'Flutter Cook Book';
    return MaterialApp(
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: GridView.builder(
          itemCount: _menu.length,
          padding: EdgeInsets.all(8.0),
          itemBuilder: (BuildContext context, int index) {
            return _buildMenu(context, _menu[index], index);
          },
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        ),
      ),
    );
  }

  Widget _buildMenu(BuildContext context, String menu, int index) {
    return GestureDetector(
      onTap: () => onMenuTab(index, context),
      child: Card(
        child: Center(
          child: Text(menu),
        ),
      ),
    );
  }
}
