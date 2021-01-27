import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

void main() => runApp(CachedImageDemo());

class CachedImageDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Cached Images';

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: CachedNetworkImage(
          placeholder: (context, url) => CircularProgressIndicator(),
          imageUrl: 'https://picsum.photos/250?image=9',
        ),
      ),
    );
  }
}
