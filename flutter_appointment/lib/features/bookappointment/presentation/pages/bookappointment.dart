import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../core/widgets/corewidgets.dart';
import '../provider/appointment_provider.dart';
import '/core/colors/colors.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../package/presentation/pages/package.dart';
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
      context.read<BookAppointmentProvider>().getAppointmentDetails();
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
                        onPressed: () {
                          if (Platform.isAndroid) {
                            SystemNavigator.pop();
                          } else if (Platform.isIOS) {
                            exit(0);
                          }
                        },
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
          body: Consumer<BookAppointmentProvider>(
              builder: (context, provider, _) {
            return provider.doctorDetailList.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const DoctorDetails(),
                          const Divider(
                            thickness: 0.5,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              DoctorInfo(
                                  icons: Icons.group,
                                  info: provider
                                      .doctorDetailList.first.patientsServed
                                      .toString(),
                                  subInfo: "Patients"),
                              DoctorInfo(
                                  icons: Icons.work,
                                  info: provider
                                      .doctorDetailList.first.yearsOfExperience
                                      .toString(),
                                  subInfo: "Years Exp."),
                              DoctorInfo(
                                  icons: Icons.star,
                                  info: provider.doctorDetailList.first.rating
                                      .toString(),
                                  subInfo: "Rating"),
                              DoctorInfo(
                                  icons: Icons.message,
                                  info: provider
                                      .doctorDetailList.first.numberOfReviews
                                      .toString(),
                                  subInfo: "Review"),
                            ],
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "BOOK APPOINTMENT",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Day",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: SizedBox(
                              height: 60,
                              child: Row(
                                children: <Widget>[
                                  ...provider.availabilityDate.map((value) {
                                    int index = provider.availabilityDate
                                        .indexOf(value);
                                    String dateString = value;
                                    DateTime date = DateTime.parse(dateString);
                                    String formattedDate =
                                        DateFormat('dd MMM').format(date);
                                    String dayOfWeek =
                                        DateFormat('EE').format(date);
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ChoiceChip(
                                        selectedColor: primaryColor,
                                        label: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 8.0, right: 8),
                                          child: Column(
                                            children: [
                                              Text(
                                                dayOfWeek,
                                                style: TextStyle(
                                                    color:
                                                        provider.selectedDateIndex ==
                                                                index
                                                            ? Colors.white
                                                            : Colors.black),
                                              ),
                                              Text(
                                                formattedDate,
                                                style: TextStyle(
                                                    color:
                                                        provider.selectedDateIndex ==
                                                                index
                                                            ? Colors.white
                                                            : Colors.black),
                                              ),
                                            ],
                                          ),
                                        ),
                                        selected:
                                            provider.selectedDateIndex == index,
                                        onSelected: (bool selected) {
                                          provider.setSelectedAvailabilityDay(
                                              index, value);
                                        },
                                      ),
                                    );
                                  })
                                ],
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("Time",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16)),
                          ),
                          SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: SizedBox(
                                height: 60,
                                child: provider.availabilityTime
                                        .elementAt(provider.selectedDateIndex)
                                        .isEmpty
                                    ? const Text("No available slots")
                                    : Row(
                                        children: <Widget>[
                                          ...provider.availabilityTime
                                              .elementAt(
                                                  provider.selectedDateIndex)
                                              .map((value) {
                                            int index = provider
                                                .availabilityTime
                                                .elementAt(
                                                    provider.selectedDateIndex)
                                                .indexOf(value);
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: ChoiceChip(
                                                selectedColor: primaryColor,
                                                label: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 8.0, right: 8),
                                                  child: Text(
                                                    value,
                                                    style: TextStyle(
                                                        color:
                                                            provider.selectedTimeIndex ==
                                                                    index
                                                                ? Colors.white
                                                                : Colors.black),
                                                  ),
                                                ),
                                                selected: provider
                                                        .selectedTimeIndex ==
                                                    index,
                                                onSelected: (bool selected) {
                                                  provider.setSelectedAvailabilityTime(
                                                      index,
                                                      provider.availabilityTime
                                                          .elementAt(provider
                                                              .selectedDateIndex)
                                                          .elementAt(index));
                                                },
                                              ),
                                            );
                                          })
                                        ],
                                      ),
                              )),
                        ]),
                  );
          }),
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
