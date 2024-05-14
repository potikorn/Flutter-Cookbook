import 'package:flutter/material.dart';

class HandleTapsDemo extends StatelessWidget {
  const HandleTapsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const _MyHomePage(title: "Gesture Demo");
  }
}

class _MyHomePage extends StatelessWidget {
  final String title;

  const _MyHomePage({
    this.title = "",
  });

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
        const snackBar = SnackBar(content: Text("Tap"));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
      child: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: Theme.of(context).buttonTheme.colorScheme?.primary,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: const Text('My Button'),
      ),
    );
  }
}
