import 'package:flutter/material.dart';

import '../../entities/schedule_entitiy.dart';

class ScheduleProvider with ChangeNotifier {
  ScheduleEntity schedule = ScheduleEntity(selectedMonthYear: DateTime.now());

  List<DateTime> rangesDates = [];

  ScheduleProvider();

  showNextMonth() {
    schedule = schedule.nextMonth();
    notifyListeners();
  }

  showPreviousMonth() {
    schedule = schedule.previewsMonth();
    notifyListeners();
  }

  void addDateToRange(DateTime date) {
    // if (date == schedule.currentDate) return;
    if (rangesDates.contains(date)) {
      rangesDates.remove(date);
    } else {
      rangesDates.add(date);
    }
    notifyListeners();
  }
}
