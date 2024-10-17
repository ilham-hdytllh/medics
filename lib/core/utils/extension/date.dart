import 'package:intl/intl.dart';

extension StringDateTimeExtension on String {
  String formatDate() {
    // Parse the string to DateTime
    DateTime dateTime = DateTime.parse(this);

    // Format the date
    final DateFormat dayFormat = DateFormat('d');
    final DateFormat monthFormat = DateFormat('MMMM');
    final DateFormat yearFormat = DateFormat('YYYY');

    String day = dayFormat.format(dateTime);
    String month = monthFormat.format(dateTime);
    String year = yearFormat.format(dateTime);

    return '$day $month' '$year';
  }

  String formatTime() {
    // Parse the string to DateTime
    DateTime dateTime = DateTime.parse(this);

    // Format the time
    final DateFormat hourFormat = DateFormat('hh : mm a');

    return hourFormat.format(dateTime);
  }

  String formatDateTime() {
    // Combine both formatted date and time
    return '${formatDate()} ${formatTime()}';
  }
}
