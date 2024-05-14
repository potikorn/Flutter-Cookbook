import 'package:flutter/material.dart';

class FadeInFadeOutAnimation extends StatefulWidget {
  const FadeInFadeOutAnimation({super.key});

  @override
  FadeInFadeOutState createState() => FadeInFadeOutState();
}

class FadeInFadeOutState extends State<FadeInFadeOutAnimation> {
  bool _visible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Opacity Demo'),
      ),
      body: Center(
        child: AnimatedOpacity(
          opacity: _visible ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 500),
          child: Container(
            width: 200.0,
            height: 200.0,
            color: Colors.green,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _visible = !_visible;
          });
        },
        tooltip: 'Toggle Opacity',
        child: const Icon(Icons.flip),
      ),
    );
  }
}
