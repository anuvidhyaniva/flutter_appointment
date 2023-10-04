import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


import '../../../../core/remoteserver/apiservice.dart';
import '../../domain/entities/appointment.dart';

class AppointmentProvider extends ChangeNotifier{
  List<Doctor> doctorDetailList = [];
  List<String> availabilityDate = [];
  List<dynamic> availabilityTime = [];
 List<Widget> availabilityDay=[];
    getAppointmentDetails() async {
    String jsonString = await ApiService()
        .get(apiEndpoint: "githubforekam/doctor-appointment/doctors");
    List<dynamic> jsonList = json.decode(jsonString);
    List<Doctor> doctors =
        jsonList.map((json) => Doctor.fromJson(json)).toList();
doctorDetailList = doctors;

                Map<String, List<dynamic>> availability = doctors.first.availability;
print(availability);
availability.keys.map((e) {
  String dateString = e;

  // Convert the date string to DateTime
  DateTime date = DateTime.parse(dateString);

  // Format the date
  String formattedDate = DateFormat('dd MMM').format(date);

  availabilityDay.add(Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ChoiceChip(
                            label: Padding(
                              padding: const EdgeInsets.only(left:8.0,right: 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                               
                                children:  [
                                Text(formattedDate),
                                Text('Choice 1'),
                               
                              ]),
                            ),
                            selected: true,
                          ),
                        ),);
                        
                      
                    },);
              

notifyListeners();
  }

}