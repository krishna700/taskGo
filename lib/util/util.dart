import 'package:flutter/material.dart';
import 'package:taskgo/config/app_theme.dart';

/// Returns the difference (in full days) between the provided date and today.
int calculateDifference(DateTime date) {
  DateTime now = DateTime.now();
  return DateTime(date.year, date.month, date.day)
      .difference(DateTime(now.year, now.month, now.day))
      .inDays;
}

// Returns true if the date difference is 0
//So the date is today
bool isDateToday(DateTime date) {
  return calculateDifference(date) == 0;
}

// Returns true if the date falls in between next 10 days
//So the date is upcoming
bool isDateUpcoming(DateTime date) {
  return calculateDifference(date) >= 1 && calculateDifference(date) < 11;
}

//Removes the focus scope of the context
void hideKeyboard(BuildContext context) {
  FocusScope.of(context).unfocus();
}

//Returns the validity of a String
bool isStringValid(String? s) {
  return s != null && s.trim().isNotEmpty;
}

//Generic vertical gap
Widget getVericalGap() {
  return const SizedBox(
    height: 24,
  );
}

//Generic widget which creates the appBar title
Widget appBarTitle(String first, String second) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Center(
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: first,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: primaryColor,
                fontSize: 28,
              ),
            ),
            TextSpan(
              text: second,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    ),
  );
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
