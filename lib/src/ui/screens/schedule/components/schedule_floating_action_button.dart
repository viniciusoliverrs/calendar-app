// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:schedule_events_app/src/application/providers/event_provider.dart';

class ScheduleFloatingnActionButton extends StatelessWidget {
  final EventProvider eventProvider;
  const ScheduleFloatingnActionButton({
    Key? key,
    required this.eventProvider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('New event'),
                IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.pop(context)),
              ],
            ),
            content: Column(mainAxisSize: MainAxisSize.min, children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Title',
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Description',
                ),
              ),
            ]),
            actions: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: const [
                  ElevatedButton(
                    onPressed: null,
                    child: Text('Save'),
                  ),
                ],
              ),
            ],
          ),
        );
      },
      child: const Icon(Icons.add),
    );
  }
}
