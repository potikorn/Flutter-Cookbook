import 'package:flutter/material.dart';

void main() => runApp(FocusTextFieldDemo());

class FocusTextFieldDemo extends StatelessWidget {
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
  FocusNode myFocusNode;

  @override
  void initState() {
    super.initState();
    myFocusNode = FocusNode();
  }

  @override
  void dispose() {
    myFocusNode.dispose();
    
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Text Field Focus')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
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
        child: Icon(Icons.edit),
      ),
    );
  }
}
