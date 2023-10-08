import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../../core/remoteserver/apiservice.dart';
import '../../data/entities/allappointment.dart';

class AllAppointmentProvider extends ChangeNotifier {
    List<Booking> appointmentList = [];

  getAllAppointments() async {
    String jsonString = await ApiService()
        .get(apiEndpoint: "githubforekam/doctor-appointment/appointments");
    List<dynamic> jsonList = json.decode(jsonString);
    List<Booking> bookings =
        jsonList.map((json) => Booking.fromJson(json)).toList();
    appointmentList = bookings;

    notifyListeners();
  }
}
