import 'package:flutter/material.dart';
import 'package:flutter_appointment/core/colors/colors.dart';
import 'package:provider/provider.dart';

import 'features/appointment/presentation/pages/appointment.dart';
import 'features/appointment/presentation/provider/appointment_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppointmentProvider()),
      ],
      child: const MainApp(),
    ),
  );
    
    
}


class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme:ThemeData(colorScheme: ColorScheme.fromSwatch().copyWith(primary: primaryColor)),
      home: BookAppointment(),
    );
  }
}
