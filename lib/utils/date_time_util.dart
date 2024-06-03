import 'package:intl/intl.dart';

extension DateTimeParser on String {
  DateTime parseToDateTime() {
    return DateTime.parse(this).toLocal();
  }
}
extension DateTimeFormatter on DateTime {
  String format(String format) {
    return DateFormat(format).format(this);
  }
}