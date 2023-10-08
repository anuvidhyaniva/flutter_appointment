import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../../core/remoteserver/apiservice.dart';
import '../../domain/entities/bookappointment_model.dart';

class BookAppointmentProvider extends ChangeNotifier {
  List<Doctor> doctorDetailList = [];
  List<String> availabilityDate = [];
  List<List> availabilityTime = [];
  List<Widget> availabilityDay = [];
  int selectedDateIndex = 0;
  int selectedTimeIndex = 0;
  String selectedDate = "";
  String selectedTime = "";

  getAppointmentDetails() async {
    String jsonString = await ApiService()
        .get(apiEndpoint: "githubforekam/doctor-appointment/doctors");
    List<dynamic> jsonList = json.decode(jsonString);
    List<Doctor> doctors =
        jsonList.map((json) => Doctor.fromJson(json)).toList();
    doctorDetailList = doctors;

    List<dynamic> data =
        doctorDetailList.first.availability.entries.map((e) => e).toList();

    for (MapEntry<String, List<dynamic>> element in data) {
      availabilityDate.add(element.key);
      availabilityTime.add(element.value);
    }
    if (availabilityDate.isNotEmpty && availabilityTime.isNotEmpty) {
      selectedDate = (availabilityDate.first);
      selectedTime = (availabilityTime.first.first.toString().split("-")[0]);
    }
    notifyListeners();
  }

  void setSelectedAvailabilityDay(int index, String date) {
    selectedDateIndex = index;
    selectedTimeIndex = 0;
    selectedDate = date;
   
    notifyListeners();
  }

  void setSelectedAvailabilityTime(int index, String time) {
    selectedTimeIndex = index;
    selectedTime = time;
    notifyListeners();
  }
  
}
