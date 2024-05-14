import 'package:flutter/material.dart';
import 'animation/fadeInFadeOut.dart';
import 'design/maindesign.dart';
import 'forms/mainforms.dart';
import 'gestures/maingestures.dart';
import 'images/mainimages.dart';
import 'listdemo/mainlist.dart';
import 'navigation/mainnavigation.dart';
import 'networking/main_networking.dart';
import 'persistence/main_persistence.dart';

import 'model/menu_model.dart';

void main() => runApp(MainMenu());

class MainMenu extends StatefulWidget {
  @override
  MainMenuState createState() {
    return new MainMenuState();
  }
}

class MainMenuState extends State<MainMenu> {
  final List<MenuModel> _menu = [
    MenuModel("Animation", "movement.jpeg"),
    MenuModel("Design", "design.jpeg"),
    MenuModel("Forms", "form.jpeg"),
    MenuModel("Gestures", "gesture.jpeg"),
    MenuModel("Images", "image.jpeg"),
    MenuModel("List", "list.jpeg"),
    MenuModel("Navigation", "navigation.jpeg"),
    MenuModel("Networking", "networking.jpeg"),
    MenuModel("Persistence", "persistence.jpeg"),
  ];

  void onMenuTab(int index, BuildContext context) {
    Widget? navigateWidget;
    switch (index) {
      case 0:
        navigateWidget = FadeInFadeOutAnimation();
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
      case 7:
        navigateWidget = MainNetworkingMenu();
        break;
      case 8:
        navigateWidget = MainPersistenceMenu();
        break;
    }
    if (navigateWidget != null) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => navigateWidget!));
    }
  }

  @override
  Widget build(BuildContext context) {
    final title = 'Flutter Cook Book';
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text(title),
          ),
          body: OrientationBuilder(
            builder: (context, orientation) {
              return GridView.builder(
                itemCount: _menu.length,
                padding: EdgeInsets.all(8.0),
                itemBuilder: (BuildContext context, int index) {
                  return _buildMenu(context, _menu[index], index);
                },
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:
                        (orientation == Orientation.portrait) ? 2 : 3),
              );
            },
          )),
    );
  }

  Widget _buildMenu(BuildContext context, MenuModel menuModel, int index) {
    return GestureDetector(
      onTap: () => onMenuTab(index, context),
      child: Card(
        child: Stack(
          children: <Widget>[
            Container(
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.5), BlendMode.multiply),
                  image: AssetImage("images/menu/${menuModel.pix}"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Center(
              child: Text(
                menuModel.menuName,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
