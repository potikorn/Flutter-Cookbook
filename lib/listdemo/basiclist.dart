import 'package:flutter/material.dart';

void main() => runApp(BasicListDemo());

class BasicListDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Basic List';

    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.map),
              title: Text('Map'),
            ),
            ListTile(
              leading: Icon(Icons.photo_album),
              title: Text('Album'),
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('Phone'),
            ),
          ],
        ),
    );
  }
}
