import 'package:flutter/material.dart';

class MaterialTouchRipple extends StatelessWidget {
  const MaterialTouchRipple({super.key});

  @override
  Widget build(BuildContext context) {
    return const _MyHomePage(title: "InkWell Demo");
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
          const SnackBar(content: Text('tap')),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(12.0),
        child: const Text('Flat Button'),
      ),
    );
  }
}
