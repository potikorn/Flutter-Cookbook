import 'package:cookbook/shared/widgets/simple_menu_list.dart';
import 'package:flutter/material.dart';
import 'animate_navigation.dart';
import 'navigate_new_demo.dart';
import 'navigate_with_named_route.dart';
import 'returning_data.dart';
import 'send_data_to_new_screen.dart';

class MainNavigationMenu extends StatelessWidget {
  const MainNavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Navigation")),
      body: SimpleMenuList(
        menuList: [
          (
            'Animating a Widget across screens',
            const AnimateNavigationDemo(),
          ),
          (
            'Navigate to a new screen and back',
            const NavigateDemo(),
          ),
          (
            'Navigate with named routes',
            const NavigateWithNamedRouteDemo(),
          ),
          (
            'Return data from a screen',
            const ReturnDataDemo(),
          ),
          (
            'Send data to a new screen',
            SendDataToNewScreenDemo(),
          ),
        ],
      ),
    );
  }
}
