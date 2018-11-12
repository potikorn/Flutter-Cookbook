import 'package:flutter/material.dart';

void main() {
  runApp(DifferentTypeDemo());
}

class DifferentTypeDemo extends StatelessWidget {
  final List<_ListItem> items = List<_ListItem>.generate(
    1000,
    (i) => i % 6 == 0
        ? _HeadingItem("Heading $i")
        : _MessageItem("Sender $i", "Message body $i"),
  );

  DifferentTypeDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = 'Mixed List';
    return MaterialApp(
        title: title,
        home: Scaffold(
          appBar: AppBar(
            title: Text(title),
          ),
          body: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];

              if (item is _HeadingItem) {
                return ListTile(
                  title: Text(item.heading,
                      style: Theme.of(context).textTheme.headline),
                );
              } else if (item is _MessageItem) {
                return ListTile(
                  title: Text(item.sender),
                  subtitle: Text(item.body),
                );
              }
            },
          ),
        ));
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
