// import 'package:intl/intl.dart';
//
 extension StringExtensions on String {

  String handleLargeText() {
    return  length<40 ?this : '${substring(0,20)}...';
  }
}
