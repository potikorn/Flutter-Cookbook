import 'package:flutter/material.dart';

void main() => runApp(OpacityDemo());

class OpacityDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Opacity Demo';
    return MaterialApp(
      title: appTitle,
      home: FadeInFadeOutAnimation(title: appTitle),
    );
  }
}

class FadeInFadeOutAnimation extends StatefulWidget {
  final String title;
  FadeInFadeOutAnimation({Key key, this.title}) : super(key: key);

  @override
  _FadeInFadeOutState createState() => _FadeInFadeOutState();
}

class _FadeInFadeOutState extends State<FadeInFadeOutAnimation> {
  bool _visible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: AnimatedOpacity(
          opacity: _visible ? 1.0 : 0.0,
          duration: Duration(milliseconds: 500),
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
        child: Icon(Icons.flip),
      ),
    );
  }
}
