import 'package:flutter/material.dart';

main() => runApp(UseCustomFont());

class UseCustomFont extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom Fonts'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Roboto Mono Sample',
              style: TextStyle(fontFamily: 'RobotoMono', fontSize: 16),
            ),
            Text(
              'Raleway Sample',
              style: TextStyle(fontFamily: 'Raleway', fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
