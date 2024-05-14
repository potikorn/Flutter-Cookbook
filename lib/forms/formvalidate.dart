import 'package:flutter/material.dart';

void main() => runApp(ValidateFormDemo());

class ValidateFormDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Form Validation Demo';
    return Scaffold(
      appBar: AppBar(
        title: Text(appTitle),
      ),
      body: CustomForm(),
    );
  }
}

class CustomForm extends StatefulWidget {
  @override
  _CustomFormState createState() {
    return _CustomFormState();
  }
}

class _CustomFormState extends State<CustomForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            validator: (value) {
              if (value?.isEmpty ?? false) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState?.validate() ?? false) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Processing Data')),
                  );
                }
              },
              child: Text('Submit'),
            ),
          )
        ],
      ),
    );
  }
}
