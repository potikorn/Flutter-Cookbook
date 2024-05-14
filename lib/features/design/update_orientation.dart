import 'package:flutter/material.dart';

class OrientationDemo extends StatelessWidget {
  const OrientationDemo({super.key});

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Orientation Demo';
    return const OrientationList(title: appTitle);
  }
}

class OrientationList extends StatelessWidget {
  const OrientationList({
    super.key,
    this.title = "",
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(title)),
        body: Stack(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Try rotate your device!',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ],
            ),
            OrientationBuilder(
              builder: (context, orientation) {
                return GridView.count(
                  crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
                  children: List.generate(100, (index) {
                    return Center(
                      child: Text(
                        'Item $index',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    );
                  }),
                );
              },
            ),
          ],
        ));
  }
}
