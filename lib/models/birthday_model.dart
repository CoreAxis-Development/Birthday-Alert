// lib/models/birthday_model.dart
import 'package:flutter/foundation.dart';

class Birthday {
  final String name;
  final DateTime date;
  final String relation;
  final int reminderDays;

  Birthday({
    required this.name,
    required this.date,
    required this.relation,
    this.reminderDays = 7,
  });
}

class BirthdayProvider with ChangeNotifier {
  final List<Birthday> _birthdays = [];

  List<Birthday> get birthdays => [..._birthdays];

  void addBirthday(Birthday birthday) {
    _birthdays.add(birthday);
    notifyListeners();
  }
}
