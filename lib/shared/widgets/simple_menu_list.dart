import 'package:flutter/material.dart';

class SimpleMenuList extends StatelessWidget {
  const SimpleMenuList({
    super.key,
    required this.menuList,
  });

  final List<(String, Widget)> menuList;

  void _onTapAction(BuildContext context, int index) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => menuList[index].$2),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: menuList.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () => _onTapAction(context, index),
          child: Card(
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 24.0,
                horizontal: 16.0,
              ),
              child: Center(
                child: Text(menuList[index].$1),
              ),
            ),
          ),
        );
      },
    );
  }
}
