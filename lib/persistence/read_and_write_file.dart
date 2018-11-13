import 'dart:io';
import 'package:flutter/material.dart';
import 'counter_storage.dart';

class ReadAndWriteFileDemo extends StatefulWidget {
  final CounterStorage storage = CounterStorage();

  @override
  _ReadAndWriteFileDemoState createState() => _ReadAndWriteFileDemoState();
}

class _ReadAndWriteFileDemoState extends State<ReadAndWriteFileDemo> {
  int _counter;

  @override
  void initState() {
    super.initState();
    widget.storage.readCounter().then((int value) {
      setState(() {
        _counter = value;
      });
    });
  }

  Future<File> _incrementCounter() async {
    setState(() {
      _counter++;
    });
    return widget.storage.writeCounter(_counter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Reading and Writing Files')),
      body: Center(
        child: Text(
          'Button tapped $_counter time${_counter == 1 ? '' : 's'}.',
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
