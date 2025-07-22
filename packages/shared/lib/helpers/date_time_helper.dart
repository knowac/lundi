import 'package:intl/intl.dart';

extension DateTimeX on DateTime {
  String toDateString() {
    final formatter = DateFormat('yyyy-MM-dd hh:mm');
    return formatter.format(this);
  }
}
