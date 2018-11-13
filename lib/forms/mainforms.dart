import 'package:flutter/material.dart';
import 'formvalidate.dart';
import 'styletextfield.dart';
import 'focustextfield.dart';
import 'handletextchange.dart';
import 'retrievevalue.dart';

void main() => runApp(MainFormMenu());

class MainFormMenu extends StatelessWidget {
  final _designMenu = [
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
    return MaterialApp(
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView.builder(
          padding: EdgeInsets.all(16.0),
          itemCount: _designMenu.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () => onTapMenu(context, index),
              child: Card(
                child: Container(
                  padding: EdgeInsets.only(
                      top: 24.0, right: 16.0, bottom: 24.0, left: 16.0),
                  child: Center(
                    child: Text(_designMenu[index]),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
