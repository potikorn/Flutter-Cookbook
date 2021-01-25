import 'package:flutter/material.dart';

void main() => runApp(ImageNetworkDemo());

class ImageNetworkDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var title = 'Web Images';

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Image.network(
        'https://picsum.photos/250?image=9',
      ),
    );
  }
}
