import 'package:flutter/material.dart';

void main() => runApp(StyleTextFieldDemo());

class StyleTextFieldDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String title = "Style a Field Demo";
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Text(
              'Text Field',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            TextField(),
            Text(
              'Text Form Field',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            TextFormField(),
          ],
        ),
      ),
    );
  }
}
