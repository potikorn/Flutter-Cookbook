import 'package:flutter/material.dart';

class SwipeToDismissDemo extends StatefulWidget {
  const SwipeToDismissDemo({super.key});

  @override
  SwipeToDismissDemoState createState() {
    return SwipeToDismissDemoState();
  }
}

class SwipeToDismissDemoState extends State<SwipeToDismissDemo> {
  final items = List<String>.generate(3, (i) => "Item ${i + 1}");

  @override
  Widget build(BuildContext context) {
    const title = 'Dismissing Items';
    return Scaffold(
      appBar: AppBar(title: const Text(title)),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Dismissible(
            key: Key(item),
            onDismissed: (direction) {
              setState(() {
                items.removeAt(index);
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("$item dismissed")),
              );
            },
            background: Container(color: Colors.red),
            child: ListTile(title: Text(item)),
          );
        },
      ),
    );
  }
}
