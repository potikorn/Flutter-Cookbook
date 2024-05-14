import 'package:cookbook/shared/widgets/simple_menu_list.dart';
import 'package:flutter/material.dart';
import 'basic_list.dart';
import 'horizontal_list.dart';
import 'grid_list.dart';
import 'different_type_list.dart';
import 'long_list.dart';

class MainListMenu extends StatelessWidget {
  const MainListMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("List")),
      body: SimpleMenuList(
        menuList: [
          (
            'Basic List',
            const BasicListDemo(),
          ),
          (
            'Create a horizontal list',
            const HorizontalListDemo(),
          ),
          (
            'Creating a Grid List',
            const GridListDemo(),
          ),
          (
            'Creating lists with different types of items',
            DifferentTypeDemo(),
          ),
          (
            'Working with long lists',
            LongListDemo(),
          ),
        ],
      ),
    );
  }
}
