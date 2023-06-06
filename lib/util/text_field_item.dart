import 'package:flutter/material.dart';

///[TextFieldItem] widget provides a streamlined way to add
///textFields throughout the app
///We can reuse the same widget everywhere in the app
///This will help us refactoring & maintaining
class TextFieldItem extends StatelessWidget {
  //TextEditing controller
  final TextEditingController? controller;
  //OnTextChanged callback for getting the text
  final Function(String)? onTextChanged;
  //Label text of the textField
  final String labelText;
  //Hint text of the textField
  final String? hintText;
  //Minimum line for the textField
  final int? minLine;
  //Maximum line for the textField
  final int? maxLine;
  //IsEnabled to enable the textField
  final bool? isEnabled;

  //To handle onTap callbacks when textField is disabled
  final Function()? onTap;

  const TextFieldItem({
    super.key,
    required this.labelText,
    this.controller,
    this.onTextChanged,
    this.hintText,
    this.maxLine = 1,
    this.minLine = 1,
    this.isEnabled = true,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      //Enable the inkWell only when onTap is not null
      enableFeedback: onTap != null,
      //onTap callBack passed to the parent
      onTap: onTap,
      child: TextField(
        onChanged: onTextChanged,
        controller: controller,
        obscureText: false,
        enabled: isEnabled,
        maxLines: maxLine,
        minLines: minLine,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 0.3, color: Colors.grey),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 0.3, color: Colors.grey),
          ),
          labelStyle: const TextStyle(color: Colors.grey),
          labelText: labelText,
          hintText: hintText,
        ),
      ),
    );
  }
}
