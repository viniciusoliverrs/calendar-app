import 'package:flutter/material.dart';
import 'package:schedule_events_app/src/domain/entities/event_entity.dart';

import '../../domain/repositories/ievent_repository.dart';

class EventProvider with ChangeNotifier {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final IEventRepository eventRepository;
  List<EventEntity> events = [];
  List<DateTime> rangesDates = [];
  EventProvider({required this.eventRepository});

  void addDateToRange(DateTime date) {
    if (date.isBefore(DateTime.now())) return;

    if (!rangesDates.contains(date)) {
      rangesDates.add(date);
    } else {
      rangesDates.remove(date);
    }
    notifyListeners();
  }
}
