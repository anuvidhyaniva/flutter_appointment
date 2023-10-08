class Booking {
  String bookingId;
  String doctorName;
  String location;
  String appointmentDate;
  String appointmentTime;

  Booking({
    required this.bookingId,
    required this.doctorName,
    required this.location,
    required this.appointmentDate,
    required this.appointmentTime,
  });

  factory Booking.fromJson(Map<String, dynamic> json) {
    return Booking(
      bookingId: json['booking_id'],
      doctorName: json['doctor_name'],
      location: json['location'],
      appointmentDate: json['appointment_date'],
      appointmentTime: json['appointment_time'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'booking_id': bookingId,
      'doctor_name': doctorName,
      'location': location,
      'appointment_date': appointmentDate,
      'appointment_time': appointmentTime,
    };
  }
}
