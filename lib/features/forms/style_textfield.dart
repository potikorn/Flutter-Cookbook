import 'package:flutter/material.dart';

class StyleTextFieldDemo extends StatelessWidget {
  const StyleTextFieldDemo({super.key});

  @override
  Widget build(BuildContext context) {
    const String title = "Style a Field Demo";
    return Scaffold(
      appBar: AppBar(title: const Text(title)),
      body: Column(
        children: <Widget>[
          Text(
            'Text Field',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const TextField(),
          Text(
            'Text Form Field',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          TextFormField(),
        ],
      ),
    );
  }
}
