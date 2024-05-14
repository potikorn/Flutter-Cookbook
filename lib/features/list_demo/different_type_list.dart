import 'package:flutter/material.dart';

class DifferentTypeDemo extends StatelessWidget {
  // ignore: library_private_types_in_public_api
  final List<_ListItem> items = List<_ListItem>.generate(
    1000,
    (i) => i % 6 == 0
        ? _HeadingItem("Heading $i")
        : _MessageItem("Sender $i", "Message body $i"),
  );

  DifferentTypeDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mixed List"),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];

          if (item is _HeadingItem) {
            return ListTile(
              title: Text(item.heading,
                  style: Theme.of(context).textTheme.headlineMedium),
            );
          } else if (item is _MessageItem) {
            return ListTile(
              title: Text(item.sender),
              subtitle: Text(item.body),
            );
          }
          return null;
        },
      ),
    );
  }
}

// The base class for the different types of items the List can contain
abstract class _ListItem {}

// A ListItem that contains data to display a heading
class _HeadingItem implements _ListItem {
  final String heading;

  _HeadingItem(this.heading);
}

// A ListItem that contains data to display a message
class _MessageItem implements _ListItem {
  final String sender;
  final String body;

  _MessageItem(this.sender, this.body);
}
