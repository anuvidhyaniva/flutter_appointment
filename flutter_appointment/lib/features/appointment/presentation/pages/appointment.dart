import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_appointment/core/remoteserver/apiservice.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../../core/widgets/bottom_navigation_bar.dart';
import '../../../../core/widgets/doctor_details.dart';
import '../../../package/presentation/pages/package.dart';
import '../../domain/entities/appointment.dart';
import '../provider/appointment_provider.dart';
import '../widgets/doctor_info.dart';

class BookAppointment extends StatefulWidget {
  const BookAppointment({super.key});

  @override
  State<BookAppointment> createState() => _BookAppointmentState();
}

class _BookAppointmentState extends State<BookAppointment> {
  @override
  void initState() {

    super.initState();
    Timer.run(() {
      context.read<AppointmentProvider>().
      getAppointmentDetails();
    });
  }



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
              centerTitle: true,
              automaticallyImplyLeading: false,
              titleSpacing: 0,
              elevation: 0,
              backgroundColor: Colors.transparent,
              title: Padding(
                padding: EdgeInsets.zero,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                        iconSize: 40,
                        onPressed: () {},
                        icon: const Icon(
                          Icons.arrow_circle_left_outlined,
                          color: Colors.grey,
                        )),
                    const Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Book Appointment",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              )),
          body: Consumer<AppointmentProvider>(
            builder: (context,provider,_) {
             
              
             
              return 
              provider.doctorDetailList.isEmpty ? const Center(child: CircularProgressIndicator()):
              Padding(
                padding: const EdgeInsets.all(16.0),
                child:
                    Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  const DoctorDetails(),
                  const Divider(
                    thickness: 0.5,
                  ),
                  const SizedBox(height: 16,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:  [
                      DoctorInfo(icons: Icons.group,info:provider.doctorDetailList.first.patientsServed.toString(),subInfo: "Patients"),
                      DoctorInfo(icons: Icons.work,info:provider.doctorDetailList.first.yearsOfExperience.toString(),subInfo: "Years Exp."),
                      DoctorInfo(icons: Icons.star,info:provider.doctorDetailList.first.rating.toString(),subInfo: "Rating"),
                      DoctorInfo(icons: Icons.message,info:provider.doctorDetailList.first.numberOfReviews.toString(),subInfo: "Review"),
                    ],
                  ),
                  const SizedBox(height: 16,),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("BOOK APPOINTMENT",style: TextStyle(color: Colors.grey),),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Day", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                  ),
                  SizedBox(
                    height: 60,
                    child: Column(
                      
                      children: provider.availabilityDay,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Time", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),
                  ),
                  Row(
                    children: [
                      ChoiceChip(
                        label: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(children: const [
                              Text('Choice 1'),
                             
                            ])),
                        selected: true,
                      ),
                    ],
                  ),
                ]),
              );
            }
          ),
          bottomNavigationBar: BottomBar(
            buttonText: "Make Appointment",
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Package()));
            },
          )),
    );
  }
}
