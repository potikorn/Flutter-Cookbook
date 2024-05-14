import 'package:flutter/material.dart';

void main() => runApp(MaterialTouchRipple());

class MaterialTouchRipple extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'InkWell Demo';
    return _MyHomePage(title: title);
  }
}

class _MyHomePage extends StatelessWidget {
  final String title;

  _MyHomePage({
    this.title = "",
  });

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
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('tap')),
        );
      },
      child: Container(
        padding: EdgeInsets.all(12.0),
        child: Text('Flat Button'),
      ),
    );
  }
}
