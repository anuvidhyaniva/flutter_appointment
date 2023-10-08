import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../../core/remoteserver/apiservice.dart';
import '../../data/entities/confirmation_model.dart';

class ConfirmationProvider extends ChangeNotifier {
  ConfirmationDetails? confirmationDetails;
  getAppointmentConfirmation() async {
    String jsonString = await ApiService().get(
        apiEndpoint: "githubforekam/doctor-appointment/booking_confirmation");
    var jsondata = json.decode(jsonString);
    ConfirmationDetails confirmationRes =
        ConfirmationDetails.fromJson(jsondata);
    confirmationDetails = confirmationRes;

    notifyListeners();
  }
}
