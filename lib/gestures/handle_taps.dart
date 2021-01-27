import 'package:flutter/material.dart';

void main() => runApp(HandleTapsDemo());

class HandleTapsDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Gesture Demo';

    return _MyHomePage(title: title);
  }
}

class _MyHomePage extends StatelessWidget {
  final String title;

  _MyHomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: _MyButton()),
    );
  }
}

class _MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final snackBar = SnackBar(content: Text("Tap"));
        Scaffold.of(context).showSnackBar(snackBar);
      },
      child: Container(
        padding: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: Theme.of(context).buttonColor,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Text('My Button'),
      ),
    );
  }
}
