import 'package:dartz/dartz.dart';
import 'package:flutter_appointment/core/error/failures.dart';
import 'package:flutter_appointment/features/appointment/domain/entities/appointment.dart';

abstract class DoctorAppointmentRepository{
  Future<Either<Failure,Doctor>> getDoctorDetails();
}