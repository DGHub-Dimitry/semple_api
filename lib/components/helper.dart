import 'package:intl/intl.dart';
import 'package:semper/components/responsive.dart';
import 'package:semper/constants/config.dart';

class Helper {
  static double getPadding(context) {
    return Responsive.isMobile(context) ? mobilePadding : desktopPadding;
  }

  static String numberToReadable(String value) {
    var formattedNumber = NumberFormat.compact().format(double.parse(value));
    return formattedNumber;
  }
}
