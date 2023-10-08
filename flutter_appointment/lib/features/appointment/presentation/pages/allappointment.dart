import 'package:flutter/material.dart';
import 'package:flutter_appointment/features/appointment/data/entities/allappointment.dart';
import 'package:flutter_appointment/features/appointment/presentation/provider/allappointment_provider.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../../core/colors/colors.dart';

class AllAppointments extends StatefulWidget {
  const AllAppointments({super.key});

  @override
  State<AllAppointments> createState() => _AllAppointmentsState();
}

class _AllAppointmentsState extends State<AllAppointments> {
  @override
  void initState() {
    super.initState();
    context.read<AllAppointmentProvider>().getAllAppointments();
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
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_circle_left_outlined,
                        color: Colors.grey,
                      )),
                  const Align(
                    alignment: Alignment.center,
                    child: Text(
                      "My Bookings",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                      iconSize: 40,
                      onPressed: () {},
                      icon: const Icon(
                        Icons.search,
                        color: Colors.grey,
                      )),
                ],
              ),
            )),
        body: Column(children: [
          const Divider(
            thickness: 0.5,
          ),
          Consumer<AllAppointmentProvider>(builder: (context, provider, _) {
            return Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView.builder(
                    itemCount: provider.appointmentList.length,
                    itemBuilder: (BuildContext context, int index) {
                      Booking booking = provider.appointmentList[index];
                      String originalDate = booking.appointmentDate;
                      DateTime dateTime = DateTime.parse(originalDate);
                      String formattedDate =
                          DateFormat('MMM d, yyyy').format(dateTime);
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                color: Colors.grey.withOpacity(0.3),
                              ),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 8.0, right: 8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8.0, top: 16.0),
                                    child: Text(
                                      "$formattedDate - ${booking.appointmentTime.split("-")[0]}",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Divider(),
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          width: 90,
                                          height: 90,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.rectangle,
                                          ),
                                          child: Image.network(
                                            "https://hireforekam.s3.ap-south-1.amazonaws.com/doctors/1-Doctor.png",
                                            width: 90,
                                            height: 90,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              booking.doctorName,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 14),
                                            ),
                                            Row(
                                              children: [
                                                const Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 8.0, bottom: 8),
                                                  child: Icon(
                                                    Icons.location_on,
                                                    color: primaryColor,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 170,
                                                  child: Text(
                                                    booking.location,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: const TextStyle(
                                                      color: Colors.grey,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                const Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 8.0,
                                                      bottom: 8,
                                                      right: 8),
                                                  child: Icon(
                                                    Icons.tablet,
                                                    color: primaryColor,
                                                  ),
                                                ),
                                                const Text(
                                                  "Booking ID: ",
                                                  style: TextStyle(
                                                    color: Colors.grey,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                                Text(
                                                  "#${booking.bookingId}",
                                                  style: const TextStyle(
                                                    color: primaryColor,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  const Padding(
                                    padding:
                                        EdgeInsets.only(left: 8.0, right: 8.0),
                                    child: Divider(),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      SizedBox(
                                        width: 150,
                                        child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  const Color.fromRGBO(
                                                      231, 240, 254, 1),
                                              foregroundColor: primaryColor,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30.0)),
                                            ),
                                            onPressed: () {},
                                            child: const Text("Cancel")),
                                      ),
                                      SizedBox(
                                        width: 150,
                                        child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30.0)),
                                            ),
                                            onPressed: () {},
                                            child: const Text("Reschedule")),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  )
                                ],
                              ),
                            )),
                      );
                    }),
              ),
            );
          })
        ]),
      ),
    );
  }
}
