import 'package:flutter/material.dart';

class ImageNetworkDemo extends StatelessWidget {
  const ImageNetworkDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Web Images")),
      body: Image.network(
        'https://github.com/flutter/website/blob/master/src/_includes/code/layout/lakes/images/lake.jpg?raw=true',
      ),
    );
  }
}
