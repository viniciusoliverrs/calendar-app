import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:schedule_events_app/src/application/providers/event_provider.dart';
import 'package:schedule_events_app/src/application/providers/schedule_provider.dart';
import 'package:schedule_events_app/src/ui/screens/schedule/components/schedule_floating_action_button.dart';

import 'components/schedule_app_bar.dart';
import 'components/schedule_body.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({Key? key}) : super(key: key);

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<ScheduleProvider, EventProvider>(
        builder: (_, scheduleProvider, eventProvider, __) {
      return Scaffold(
        appBar: ScheduleAppBar(
          goBack: scheduleProvider.showPreviousMonth,
          goForward: scheduleProvider.showNextMonth,
          title: scheduleProvider.schedule.toString(),
        ),
        body: Column(children: [
          ScheduleBody(
            schedule: scheduleProvider.schedule,
            rangesDates: eventProvider.rangesDates,
            addDateToRange: eventProvider.addDateToRange,
          ),
          // ScheduleEventList(
          //   rangesDates: eventProvider.rangesDates
          // ),
        ]),
        floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
        floatingActionButton: eventProvider.rangesDates.isNotEmpty
            ? ScheduleFloatingnActionButton(eventProvider: eventProvider)
            : null,
      );
    });
  }
}
