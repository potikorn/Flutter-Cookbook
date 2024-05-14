import 'package:cookbook/features/animation/animate_page_route_transition.dart';
import 'package:cookbook/features/animation/animated_container_app.dart';
import 'package:cookbook/features/animation/fade_in_fade_out.dart';
import 'package:cookbook/features/animation/physics_card_drag_demo.dart';
import 'package:cookbook/shared/widgets/simple_menu_list.dart';
import 'package:flutter/material.dart';

class AnimationMenu extends StatelessWidget {
  const AnimationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Animation")),
      body: const SimpleMenuList(
        menuList: [
          (
            "Animate a page route transition",
            AnimateRouteTransitionFirstPage(),
          ),
          (
            "Animate a widget using a physics simulation",
            PhysicsCardDargDemo(),
          ),
          (
            "Animate the properties of a container",
            AnimatedContainerApp(),
          ),
          (
            "Fade a widget in and out",
            FadeInFadeOutAnimation(),
          ),
        ],
      ),
    );
  }
}
