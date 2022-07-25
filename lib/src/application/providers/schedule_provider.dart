import 'package:flutter/material.dart';
import 'package:schedule_events_app/src/domain/entities/schedule_entitiy.dart';

class ScheduleProvider with ChangeNotifier {
  ScheduleEntity schedule = ScheduleEntity(selectedMonthYear: DateTime.now());

  showNextMonth() {
    schedule = schedule.nextMonth();
    notifyListeners();
  }

  showPreviousMonth() {
    schedule = schedule.previewsMonth();
    notifyListeners();
  }
}
