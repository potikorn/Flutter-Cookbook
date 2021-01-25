import 'package:flutter/material.dart';

main() => runApp(AppbarAbove());

class AppbarAbove extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text('Floating app bar'),
            floating: true,
            flexibleSpace: Placeholder(),
            expandedHeight: 280,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                (context, index) => ListTile(title: Text('Item #$index')),
                childCount: 1000),
          )
        ],
      ),
    );
  }
}
