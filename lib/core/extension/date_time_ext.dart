import 'package:intl/intl.dart';

extension TextToDateTime on String {
  /// Converts the text to DateTime using the provided [pattern].
  /// Example pattern: 'yyyy-MM-dd', 'dd/MM/yyyy', etc.
  DateTime? toDateTime({required String pattern}) {
    try {
      return DateFormat(pattern).parse(this);
    } catch (e) {
      print('Error parsing date: $e');
      return null;
    }
  }

  /// Converts the text to formatted String Date using [inputPattern] and [outputPattern]
  String? reformatDate({required String inputPattern, required String outputPattern}) {
    try {
      final dateTime = DateFormat(inputPattern).parse(this);
      return DateFormat(outputPattern).format(dateTime);
    } catch (e) {
      print('Error reformatting date: $e');
      return null;
    }
  }
}
