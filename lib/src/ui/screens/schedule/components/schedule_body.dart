import 'package:flutter/material.dart';
import 'package:schedule_events_app/src/domain/entities/schedule_entitiy.dart';

import 'schedule_day_container.dart';

class ScheduleBody extends StatelessWidget {
  final ScheduleEntity schedule;
  final List<DateTime> rangesDates;
  final Function(DateTime date) addDateToRange;
  const ScheduleBody({
    Key? key,
    required this.schedule,
    required this.rangesDates,
    required this.addDateToRange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var days = schedule.getDaysInMonth();
    return Expanded(
      child: GridView.builder(
          itemCount: days.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7,
            childAspectRatio: 1,
          ),
          itemBuilder: (context, index) {
            final date = days[index];
            return ScheduleDayContainer(
              isSelected: rangesDates.contains(date),
              date: date,
              addDateToRange: addDateToRange,
              isToday: (DateTime.now().day == date.day &&
                  DateTime.now().month == date.month &&
                  DateTime.now().year == date.year),
              isDatePassed:
                  date.isBefore(DateTime.now().add(const Duration(days: -1))),
            );
          }),
    );
  }
}
