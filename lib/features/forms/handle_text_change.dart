import 'package:flutter/material.dart';

class HandleTextChangedDemo extends StatelessWidget {
  const HandleTextChangedDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return _MyCustomForm();
  }
}

class _MyCustomForm extends StatefulWidget {
  @override
  __MyCustomFormState createState() => __MyCustomFormState();
}

class __MyCustomFormState extends State<_MyCustomForm> {
  final myController = TextEditingController();

  @override
  void initState() {
    super.initState();
    myController.addListener(_printLatestValue);
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  _printLatestValue() {
    debugPrint("Second text field : ${myController.text}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Retrieve Text Input'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              onChanged: (text) {
                debugPrint("First text field: $text");
              },
            ),
            TextField(
              controller: myController,
            ),
          ],
        ),
      ),
    );
  }
}
