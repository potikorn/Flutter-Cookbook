import 'package:flutter/material.dart';
import 'formvalidate.dart';
import 'styletextfield.dart';
import 'focustextfield.dart';
import 'handletextchange.dart';
import 'retrievevalue.dart';
import '../simplelist.dart';

void main() => runApp(MainFormMenu());

class MainFormMenu extends StatelessWidget {
  final _formMenu = [
    'Building a form with validation',
    'Create and style a text field',
    'Focus on a Text Field',
    'Handling changes to a text field',
    'Retrieve the value of a text field',
  ];
  final title = "Forms";

  void onTapMenu(BuildContext context, int index) {
    Widget navigatorWidget;
    switch (index) {
      case 0:
        navigatorWidget = ValidateFormDemo();
        break;
      case 1:
        navigatorWidget = StyleTextFieldDemo();
        break;
      case 2:
        navigatorWidget = FocusTextFieldDemo();
        break;
      case 3:
        navigatorWidget = HandleTextChangedDemo();
        break;
      case 4:
        navigatorWidget = RetrieveValueDemo();
        break;
    }
    if (navigatorWidget != null) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => navigatorWidget));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SimpleList(list: _formMenu, onTapAction: onTapMenu),
    );
  }
}
