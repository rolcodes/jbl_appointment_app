import 'package:flutter/material.dart';

class CalendarModel extends ChangeNotifier {
  DateTime _first = DateTime.now();

  /// this return selected first date
  DateTime get firstDate {
    return _first;
  }

  /// this notify the app, a date have been selected
  void getDataRange(DateTime first) {
    _first = first;
    notifyListeners();
  }
}