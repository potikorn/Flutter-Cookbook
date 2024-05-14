import 'package:flutter/material.dart';

class RetrieveValueDemo extends StatelessWidget {
  const RetrieveValueDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return _MyCustomFrom();
  }
}

class _MyCustomFrom extends StatefulWidget {
  @override
  __MyCustomFromState createState() => __MyCustomFromState();
}

class __MyCustomFromState extends State<_MyCustomFrom> {
  // Create a text controller. We will use it to retrieve the current value
  // of the TextField!
  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Retrieve Text Input")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          controller: myController,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // When the user presses the button, show an alert dialog with the
        // text the user has typed into our text field.
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                // Retrieve the text the user has typed in using our
                // TextEditingController
                content: Text(myController.text),
              );
            },
          );
          return;
        },
        tooltip: 'Show me the value!',
        child: const Icon(Icons.text_fields),
      ),
    );
  }
}
