import 'package:flutter/material.dart';

class LongListDemo extends StatelessWidget {
  final List<String> items = List<String>.generate(10000, (i) => "Item $i");

  LongListDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Long List")),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(items[index]),
          );
        },
      ),
    );
  }
}
