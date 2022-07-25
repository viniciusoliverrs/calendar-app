// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

class ScheduleEventList extends StatelessWidget {
  List<DateTime> rangesDates;
  ScheduleEventList({
    Key? key,
    required this.rangesDates,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListView.builder(
          
          itemCount: rangesDates.length,
          itemBuilder: (context, index) {
            final date = rangesDates[index];
            return ListTile(
              title: Text('$date'),
            );
          },
        ),
      ],
    );
  }
}
