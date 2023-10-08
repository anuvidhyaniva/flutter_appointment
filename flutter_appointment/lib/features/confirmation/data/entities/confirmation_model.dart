class ConfirmationDetails {
  ConfirmationDetails({
    required this.doctorName,
    required this.appointmentDate,
    required this.appointmentTime,
    required this.location,
    required this.appointmentPackage,
  });
  final String doctorName;
  final String appointmentDate;
  final String appointmentTime;
  final String location;
  final String appointmentPackage;

  factory ConfirmationDetails.fromJson(Map<String, dynamic> json) {
    return ConfirmationDetails(
        doctorName: json['doctor_name'],
        appointmentDate: json['appointment_date'],
        appointmentTime: json['appointment_time'],
        location: json['location'],
        appointmentPackage: json['appointment_package']);
  }
}
