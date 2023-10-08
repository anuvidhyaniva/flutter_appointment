import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../../core/remoteserver/apiservice.dart';
import '../../domain/entities/package_model.dart';

class SelectPackage extends ChangeNotifier {
  List<String> duration = [];
  List<String> package = [];
  String? selectedDuration;
  String? selectedPackage;
  String isSelected = "false";
  getPackage() async {
    String jsonString = await ApiService().get(
        apiEndpoint: "githubforekam/doctor-appointment/appointment_options");

    var res = json.decode(jsonString) as Map<String, dynamic>;
    Package data = Package.fromJson(res);
    duration = data.duration;
    package = data.package;
    selectedPackage = package[0];
    notifyListeners();
  }

  setSelectedDuration(String duration) {
    selectedDuration = duration;
    notifyListeners();
  }

  setPackageSelected(int index) {
    isSelected = package[index];
    selectedPackage = package[index];
    notifyListeners();
  }
}
