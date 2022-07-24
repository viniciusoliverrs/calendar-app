import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:schedule_events_app/src/application/providers/schedule_provider.dart';
import 'package:schedule_events_app/src/ui/screens/schedule/components/schedule_event_list.dart';

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
    return Consumer<ScheduleProvider>(builder: (_, provider, __) {
      return Scaffold(
        appBar: ScheduleAppBar(
          goBack: provider.showPreviousMonth,
          goForward: provider.showNextMonth,
          title: provider.schedule.toString(),
        ),
        body: Column(children: [
          ScheduleBody(provider: provider),
          ScheduleEventList(rangesDates: provider.rangesDates),
        ]),
        floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
        floatingActionButton: provider.rangesDates.isNotEmpty
            ? FloatingActionButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) => const AlertDialog(
                      title: Text('Are you sure you want to schedule?'),
                      actions: [
                        ElevatedButton(
                          onPressed: null,
                          child: Text('No'),
                        ),
                        ElevatedButton(
                          onPressed: null,
                          child: Text('Yes'),
                        ),
                      ],
                    ),
                  );
                },
                child: const Icon(Icons.add),
              )
            : null,
      );
    });
  }
}
