import 'package:flutter/material.dart';
import '/core/colors/colors.dart';
import '/features/appointment/presentation/provider/allappointment_provider.dart';
import '/features/package/presentation/provider/select_package.dart';
import 'package:provider/provider.dart';

import 'features/bookappointment/presentation/pages/bookappointment.dart';
import 'features/bookappointment/presentation/provider/appointment_provider.dart';
import 'features/confirmation/presentation/provider/confirmation_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BookAppointmentProvider()),
        ChangeNotifierProvider(create: (_) => SelectPackage()),
        ChangeNotifierProvider(create: (_) => ConfirmationProvider()),
        ChangeNotifierProvider(create: (_) => AllAppointmentProvider())
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme:
              ColorScheme.fromSwatch().copyWith(primary: primaryColor)),
      home: const BookAppointment(),
    );
  }
}
