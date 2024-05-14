import 'package:flutter/material.dart';

class FocusTextFieldDemo extends StatelessWidget {
  const FocusTextFieldDemo({super.key});

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
  FocusNode? myFocusNode;

  @override
  void initState() {
    super.initState();
    myFocusNode = FocusNode();
  }

  @override
  void dispose() {
    myFocusNode?.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Text Field Focus')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            const TextField(
              autocorrect: true,
            ),
            TextField(
              focusNode: myFocusNode,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => FocusScope.of(context).requestFocus(myFocusNode),
        tooltip: 'Focus Second Text Field',
        child: const Icon(Icons.edit),
      ),
    );
  }
}
