import 'package:intl/intl.dart';

extension FormattedDate on DateTime {
  String format(String format) {
    return DateFormat(format).format(this);
  }
}
