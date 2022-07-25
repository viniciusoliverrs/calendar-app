import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:schedule_events_app/src/data/repositories/event_repository.dart';
import 'package:schedule_events_app/src/domain/repositories/ievent_repository.dart';
import 'package:schedule_events_app/src/ui/screens/schedule/schedule_screen.dart';

import 'application/providers/event_provider.dart';
import 'application/providers/schedule_provider.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<IEventRepository>(
          create: (_) => EventRepository(),
        ),
        ChangeNotifierProvider(
            create: (context) =>
                EventProvider(eventRepository: context.read())),
        ChangeNotifierProvider(create: (_) => ScheduleProvider()),
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
