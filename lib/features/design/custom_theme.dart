import 'package:flutter/material.dart';

class CustomThemeDemo extends StatelessWidget {
  const CustomThemeDemo({super.key});

  @override
  Widget build(BuildContext context) {
    const appName = 'Custom Themes';
    return const _CustomTheme(title: appName);
  }
}

class _CustomTheme extends StatelessWidget {
  final String? title;

  const _CustomTheme({this.title});

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
        child: const FloatingActionButton(
          onPressed: null,
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
