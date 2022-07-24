import 'package:flutter/material.dart';
import 'package:schedule_events_app/src/application/providers/schedule_provider.dart';

import 'schedule_day_container.dart';

class ScheduleBody extends StatelessWidget {
  final ScheduleProvider provider;
  const ScheduleBody({
    Key? key,
    required this.provider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var days = provider.schedule.getDaysInMonth();
    return Expanded(
      flex: 2,
      child: GridView.builder(
          itemCount: days.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7,
            childAspectRatio: 1,
          ),
          itemBuilder: (context, index) {
            final date = days[index];
            return ScheduleDayContainer(
              isSelected: provider.rangesDates.contains(date),
              date: date,
              provider: provider,
              isToday: (DateTime.now().day == date.day &&
                  DateTime.now().month == date.month &&
                  DateTime.now().year == date.year),
              isDatePassed: false,
              isMonthPassed: date.month < DateTime.now().month ||
                  date.year < DateTime.now().year,
              isPreviewNextMonth:
                  false, //(date.month >= DateTime.now().month + 1 && date.year >= DateTime.now().year)
            );
          }),
    );
  }
}
