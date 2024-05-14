import 'package:flutter/material.dart';

void main() {
  runApp(OreintationDemo());
}

class OreintationDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Orientation Demo';

    return OrientationList(title: appTitle);
  }
}

class OrientationList extends StatelessWidget {
  final title;
  OrientationList({super.key, this.title});

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
                  style: Theme.of(context).textTheme.displayLarge,
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
