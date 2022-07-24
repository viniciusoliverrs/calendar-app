import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:schedule_events_app/src/ui/screens/schedule/schedule_screen.dart';

import 'application/providers/schedule_provider.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ScheduleProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const ScheduleScreen(),
      ),
    );
  }
}
