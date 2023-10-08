import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/colors/colors.dart';
import '../../../../core/widgets/bottom_navigation_bar.dart';
import '../../../appointment/presentation/pages/allappointment.dart';
import '../provider/confirmation_provider.dart';

class Confirmation extends StatefulWidget {
  const Confirmation({super.key});

  @override
  State<Confirmation> createState() => _ConfirmationState();
}

class _ConfirmationState extends State<Confirmation> {
  @override
  void initState() {
    super.initState();
    context.read<ConfirmationProvider>().getAppointmentConfirmation();
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
                          "Confirmation",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                )),
            body:
                Consumer<ConfirmationProvider>(builder: (context, provider, _) {
              return provider.confirmationDetails != null
                  ? ListView(
                      children: [
                        const SizedBox(
                          height: 50,
                        ),
                        Container(
                          width: 100,
                          height: 100,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: primaryColor,
                          ),
                          child: const Icon(
                            Icons.check,
                            size: 50,
                            color: Colors.white,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              "Appointment confirmed!",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 20),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              "You have successfully booked appointment with",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: Colors.grey),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              provider.confirmationDetails!.doctorName,
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 16.0, top: 16, bottom: 16),
                          child: Row(
                            children: const [
                              Icon(
                                Icons.person,
                                color: primaryColor,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                "Esther Howard",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 16.0, bottom: 16),
                          child: Row(
                            children: [
                              const Icon(Icons.calendar_month,
                                  color: primaryColor),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(
                                provider.confirmationDetails!.appointmentDate,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(
                                width: 24,
                              ),
                              const Icon(Icons.timer, color: primaryColor),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(
                                provider.confirmationDetails!.appointmentTime,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                  : const Text("No details available");
            }),
            bottomNavigationBar: BottomBar(
              buttonText: "View Appointments",
              isConfirmationPage: true,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AllAppointments()));
              },
            )));
  }
}
