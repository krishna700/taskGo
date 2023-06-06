import 'package:flutter/material.dart';
import 'package:taskgo/config/app_theme.dart';

//Removes the focus scope of the context
void hideKeyboard(BuildContext context) {
  FocusScope.of(context).unfocus();
}

bool isStringValid(String? s) {
  return s != null && s.trim().isNotEmpty;
}

//Generic confirmation popup
showConfirmAlertDialog({
  required BuildContext context,
  required Function() onCancel,
  required Function() onConfirm,
  required String title,
  required String description,
}) {
  Widget cancelButton = TextButton(
    onPressed: onCancel,
    child: const Text(
      "Cancel",
      style: AppTheme.text3,
    ),
  );
  Widget launchButton = TextButton(
    onPressed: onConfirm,
    child: const Text(
      "Confirm",
      style: AppTheme.text1,
    ),
  );
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(
      title,
      style: AppTheme.headline1,
    ),
    content: Text(
      description,
      style: AppTheme.text1,
    ),
    actions: [
      cancelButton,
      launchButton,
    ],
  );
  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
