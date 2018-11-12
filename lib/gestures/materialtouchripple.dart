import 'package:flutter/material.dart';

void main() => runApp(MaterialTouchRipple());

class MaterialTouchRipple extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'InkWell Demo';
    return MaterialApp(
      title: title,
      home: _MyHomePage(
        title: title,
      ),
    );
  }
}

class _MyHomePage extends StatelessWidget {
  final String title;

  _MyHomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(child: _MyButton()),
    );
  }
}

class _MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text('tap'),
        ));
      },
      child: Container(
        padding: EdgeInsets.all(12.0),
        child: Text('Flat Button'),
      ),
    );
  }
}
