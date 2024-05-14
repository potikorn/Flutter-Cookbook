import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class FadeInWithPlaceHolderDemo extends StatelessWidget {
  const FadeInWithPlaceHolderDemo({super.key});

  @override
  Widget build(BuildContext context) {
    const title = 'Fade in images';

    return Scaffold(
      appBar: AppBar(title: const Text(title)),
      body: Stack(
        children: <Widget>[
          const Center(child: CircularProgressIndicator()),
          Center(
            child: FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image:
                  'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif',
            ),
          )
        ],
      ),
    );
  }
}
