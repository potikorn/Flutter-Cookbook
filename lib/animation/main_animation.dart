import 'package:cookbook/animation/animated_container.dart';
import 'package:cookbook/animation/fade_in_fade_out.dart';
import 'package:cookbook/animation/physics_simulation.dart';
import 'package:cookbook/animation/route-transition.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../simplelist.dart';

void main() => runApp(MainAnimationMenu());

class MainAnimationMenu extends StatelessWidget {
  final _designMenu = [
    'Animate a page route transition',
    'Animate a widget using a physics simulation',
    'Animate the properties of a container',
    'Fade a widget in and out',
  ];
  final title = "Animation";

  void onTapMenu(BuildContext context, int index) {
    Widget navigatorWidget;
    switch (index) {
      case 0:
        navigatorWidget = Page1();
        break;
      case 1:
        navigatorWidget = PhysicsCardDragDemo();
        break;
      case 2:
        navigatorWidget = AnimatedContainerApp();
        break;
      case 3:
        navigatorWidget = FadeInFadeOutAnimation();
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
