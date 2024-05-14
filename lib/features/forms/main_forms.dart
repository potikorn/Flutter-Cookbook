import 'package:cookbook/shared/widgets/simple_menu_list.dart';
import 'package:flutter/material.dart';
import 'form_validate.dart';
import 'style_textfield.dart';
import 'focus_textfield.dart';
import 'handle_text_change.dart';
import 'retrieve_value.dart';

class MainFormMenu extends StatelessWidget {
  const MainFormMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Forms")),
      body: const SimpleMenuList(
        menuList: [
          (
            'Building a form with validation',
            ValidateFormDemo(),
          ),
          (
            'Create and style a text field',
            StyleTextFieldDemo(),
          ),
          (
            'Focus on a Text Field',
            FocusTextFieldDemo(),
          ),
          (
            'Handling changes to a text field',
            HandleTextChangedDemo(),
          ),
          (
            'Retrieve the value of a text field',
            RetrieveValueDemo(),
          ),
        ],
      ),
    );
  }
}
