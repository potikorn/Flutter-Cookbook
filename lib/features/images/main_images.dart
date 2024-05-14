import 'package:cookbook/shared/widgets/simple_menu_list.dart';
import 'package:flutter/material.dart';
import 'image_network.dart';
import 'fade_in_image.dart';
import 'cached_image.dart';

class MainImagesMenu extends StatelessWidget {
  const MainImagesMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Images")),
      body: const SimpleMenuList(menuList: [
        (
          'Display images from the internet',
          ImageNetworkDemo(),
        ),
        (
          'Fade in images with a placeholder',
          FadeInWithPlaceHolderDemo(),
        ),
        (
          'Working with cached images',
          CachedImageDemo(),
        ),
      ]),
    );
  }
}
