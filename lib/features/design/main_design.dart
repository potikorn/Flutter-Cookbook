import 'package:cookbook/shared/widgets/simple_menu_list.dart';
import 'package:flutter/material.dart';
import 'add_drawer.dart';
import 'display_snackbar.dart';
import 'update_orientation.dart';
import 'custom_theme.dart';
import 'tab_bar.dart';

class MainDesignMenu extends StatelessWidget {
  final title = "Design";

  const MainDesignMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: const SimpleMenuList(
        menuList: ([
          (
            "Add a Drawer to a screen",
            AddDrawer(),
          ),
          (
            "Displaying Snackbars",
            SnackBarDemo(),
          ),
          (
            "Updating the UI based on orientation",
            OrientationDemo(),
          ),
          (
            "Using Themes to share colors and font styles",
            CustomThemeDemo(),
          ),
          (
            "Working with Tabs",
            TabBarDemo(),
          ),
        ]),
      ),
    );
  }
}
