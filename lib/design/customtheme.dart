import 'package:flutter/material.dart';

void main() {
  runApp(CustomThemeDemo());
}

class CustomThemeDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appName = 'Custom Themes';

    return MaterialApp(
      title: appName,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.lightBlue[800],
        colorScheme: ColorScheme.light(
          onPrimary: Colors.cyan.shade600,
        ),
      ),
      home: _CustomTheme(
        title: appName,
      ),
    );
  }
}

class _CustomTheme extends StatelessWidget {
  final String? title;

  _CustomTheme({this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title ?? ""),
      ),
      body: Center(
        child: Container(
          color: Theme.of(context).colorScheme.secondary,
          child: Text(
            'Text with a background color',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
      ),
      floatingActionButton: Theme(
        data: Theme.of(context).copyWith(primaryColor: Colors.yellow),
        child: FloatingActionButton(
          onPressed: null,
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
