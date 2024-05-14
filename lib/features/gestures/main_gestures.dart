import 'package:cookbook/shared/widgets/simple_menu_list.dart';
import 'package:flutter/material.dart';
import 'material_touch_ripple.dart';
import 'handle_taps.dart';
import 'swipe_to_dismiss.dart';

class MainGesturesMenu extends StatelessWidget {
  const MainGesturesMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Gestures")),
      body: const SimpleMenuList(
        menuList: [
          (
            'Adding Material Touch Ripples',
            MaterialTouchRipple(),
          ),
          (
            'Handling Taps',
            HandleTapsDemo(),
          ),
          (
            'Implement Swipe to Dismiss',
            SwipeToDismissDemo(),
          ),
        ],
      ),
    );
  }
}
