import 'package:flutter/material.dart';

class SimpleList extends StatelessWidget {
  final List<String>? list;
  final onTapAction;

  SimpleList({super.key, this.list, this.onTapAction});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(16.0),
      itemCount: list?.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () => onTapAction(context, index),
          child: Card(
            child: Container(
              padding: EdgeInsets.only(
                  top: 24.0, right: 16.0, bottom: 24.0, left: 16.0),
              child: Center(
                child: Text(list?[index] ?? ""),
              ),
            ),
          ),
        );
      },
    );
  }
}
