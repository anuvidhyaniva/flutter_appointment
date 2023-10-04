import 'package:equatable/equatable.dart';


class Doctor extends Equatable {
  final String doctorName;
  final String image;
  final String speciality;
  final String location;
  final int patientsServed;
  final int yearsOfExperience;
  final double rating;
  final int numberOfReviews;
  final Map<String, List<dynamic>> availability;

  const Doctor({
    required this.doctorName,
    required this.image,
    required this.speciality,
    required this.location,
    required this.patientsServed,
    required this.yearsOfExperience,
    required this.rating,
    required this.numberOfReviews,
    required this.availability,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      doctorName: json['doctor_name'],
      image: json['image'],
      speciality: json['speciality'],
      location: json['location'],
      patientsServed: json['patients_served'],
      yearsOfExperience: json['years_of_experience'],
      rating: json['rating'],
      numberOfReviews: json['number_of_reviews'],
      availability: Map<String, List<dynamic>>.from(json['availability']),
    );
  }

  @override
  List<Object?> get props => [
    doctorName,
    image,
    speciality,
    location,
    patientsServed,
    yearsOfExperience,
    rating,
    numberOfReviews,
    availability,
  ];
}