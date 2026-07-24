import 'package:intl/intl.dart';

extension StringExtension on String {
  String capitalize() {
    if (isEmpty) return this;
    return this[0].toUpperCase() + substring(1);
  }

  String toTitleCase() {
    return split(' ').map((word) => word.capitalize()).join(' ');
  }
}

extension DateTimeExtension on DateTime {
  String toReadableString() {
    return DateFormat('MMM dd, yyyy - hh:mm a').format(this);
  }

  String toDateOnly() {
    return DateFormat('MMM dd, yyyy').format(this);
  }

  String toTimeOnly() {
    return DateFormat('hh:mm a').format(this);
  }

  bool isToday() {
    final now = DateTime.now();
    return year == now.year && month == now.month && day == now.day;
  }

  bool isYesterday() {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return year == yesterday.year && month == yesterday.month && day == yesterday.day;
  }
}

extension IntExtension on int {
  String toFormattedString() {
    return toString().replaceAllMapped(
      RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]},',
    );
  }
}

extension DoubleExtension on double {
  String toFormattedString({int decimals = 2}) {
    return toStringAsFixed(decimals);
  }
}
