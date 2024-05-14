import 'package:cookbook/features/animation/animation.dart';
import 'package:cookbook/features/design/design.dart';
import 'package:cookbook/features/forms/forms.dart';
import 'package:cookbook/features/gestures/gestures.dart';
import 'package:cookbook/features/images/images.dart';
import 'package:cookbook/features/list_demo/list_demo.dart';
import 'package:cookbook/features/navigation/navigation.dart';
import 'package:cookbook/features/networking/networking.dart';
import 'package:cookbook/features/persistence/persistence.dart';
import 'package:cookbook/features/home/models/menu_model.dart';
import 'package:flutter/material.dart';

class HomeMenu extends StatelessWidget {
  HomeMenu({super.key});

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

  void _onMenuTab(int index, BuildContext context) {
    Widget? navigateWidget;
    switch (index) {
      case 0:
        navigateWidget = const AnimationMenu();
        break;
      case 1:
        navigateWidget = const MainDesignMenu();
        break;
      case 2:
        navigateWidget = const MainFormMenu();
        break;
      case 3:
        navigateWidget = const MainGesturesMenu();
        break;
      case 4:
        navigateWidget = const MainImagesMenu();
        break;
      case 5:
        navigateWidget = const MainListMenu();
        break;
      case 6:
        navigateWidget = const MainNavigationMenu();
        break;
      case 7:
        navigateWidget = const MainNetworkingMenu();
        break;
      case 8:
        navigateWidget = const MainPersistenceMenu();
        break;
    }
    if (navigateWidget != null) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => navigateWidget!));
    }
  }

  Widget _buildMenu(BuildContext context, MenuModel menuModel, int index) {
    return GestureDetector(
      onTap: () => _onMenuTab(index, context),
      child: Card(
        child: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Flutter Cook Book")),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return GridView.builder(
            itemCount: _menu.length,
            padding: const EdgeInsets.all(8.0),
            itemBuilder: (BuildContext context, int index) {
              return _buildMenu(context, _menu[index], index);
            },
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: (orientation == Orientation.portrait) ? 2 : 3),
          );
        },
      ),
    );
  }
}
