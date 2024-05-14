import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CachedImageDemo extends StatelessWidget {
  const CachedImageDemo({super.key});

  @override
  Widget build(BuildContext context) {
    const title = 'Cached Images';

    return Scaffold(
      appBar: AppBar(title: const Text(title)),
      body: Center(
        child: CachedNetworkImage(
          placeholder: (context, url) => const CircularProgressIndicator(),
          imageUrl:
              'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif',
        ),
      ),
    );
  }
}
