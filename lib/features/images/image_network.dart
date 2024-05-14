import 'package:flutter/material.dart';

class ImageNetworkDemo extends StatelessWidget {
  const ImageNetworkDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Web Images")),
      body: Image.network(
        'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif',
      ),
    );
  }
}
