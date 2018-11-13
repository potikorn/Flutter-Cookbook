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
        'https://github.com/flutter/website/blob/master/src/_includes/code/layout/lakes/images/lake.jpg?raw=true',
      ),
    );
  }
}
