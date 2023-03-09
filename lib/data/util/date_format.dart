import 'package:intl/intl.dart';

class Util {
  Util._();

  static getFormattedDate(DateTime dateTime) {
    return DateFormat('MM/dd/yyyy hh:m a').format(dateTime);
  }
}
