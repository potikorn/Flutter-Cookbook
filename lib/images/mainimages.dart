import 'package:flutter/material.dart';
import 'package:cookbook/simplelist.dart';
import 'imagenetwork.dart';
import 'fadeinimage.dart';
import 'cachedimage.dart';

void main() => runApp(MainImagesMenu());

class MainImagesMenu extends StatelessWidget {
  final _imageMenu = [
    'Display images from the internet',
    'Fade in images with a placeholder',
    'Working with cached images',
  ];
  final title = "Images";

  void onTapMenu(BuildContext context, int index) {
    Widget? navigatorWidget;
    switch (index) {
      case 0:
        navigatorWidget = ImageNetworkDemo();
        break;
      case 1:
        navigatorWidget = FadeInWithPlaceHolderDemo();
        break;
      case 2:
        navigatorWidget = CachedImageDemo();
        break;
    }
    if (navigatorWidget != null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => navigatorWidget!),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SimpleList(list: _imageMenu, onTapAction: onTapMenu),
    );
  }
}
