import 'package:flutter/material.dart';
import 'package:flutter_appointment/features/bookappointment/presentation/provider/appointment_provider.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../../core/widgets/bottom_navigation_bar.dart';
import '../../../../core/widgets/doctor_details.dart';
import '../../../confirmation/presentation/pages/confirmation.dart';
import '../../../package/presentation/provider/select_package.dart';

class ReviewSummary extends StatefulWidget {
  const ReviewSummary({super.key});

  @override
  State<ReviewSummary> createState() => _ReviewSummaryState();
}

class _ReviewSummaryState extends State<ReviewSummary> {
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
                        "Review Summary",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              )),
          body: Column(
            children: [
              const DoctorDetails(),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Divider(
                  thickness: 0.5,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24.0, right: 24),
                child: Column(
                  children: [
                    Consumer<BookAppointmentProvider>(
                        builder: (context, provider, _) {
                      String dateString = provider.selectedDate;
                      DateTime date = DateTime.parse(dateString);
                      String formattedDate = DateFormat('dd MMM').format(date);
                      return Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Text("Date & Hour",
                                style: TextStyle(color: Colors.grey),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left),
                            const SizedBox(
                              width: 8,
                            ),
                            Expanded(
                                child: Text(
                                    "$formattedDate - ${provider.selectedTime}",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.right)),
                          ]);
                    }),
                    Consumer<SelectPackage>(builder: (context, provider, _) {
                      return Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Text("Package",
                                style: TextStyle(color: Colors.grey),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left),
                            const SizedBox(
                              width: 8,
                            ),
                            Expanded(
                                child: Text(provider.selectedDuration ?? "-",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.right)),
                          ]);
                    }),
                    Consumer<SelectPackage>(builder: (context, provider, _) {
                      return Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Text("Duration",
                                style: TextStyle(color: Colors.grey),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left),
                            const SizedBox(
                              width: 8,
                            ),
                            Expanded(
                                child: Text(provider.selectedPackage ?? "-",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.right)),
                          ]);
                    }),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: const [
                          Text("Booking for",
                              style: TextStyle(color: Colors.grey),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left),
                          SizedBox(
                            width: 8,
                          ),
                          Expanded(
                              child: Text("self",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.right)),
                        ]),
                  ],
                ),
              )
            ],
          ),
          bottomNavigationBar: BottomBar(
            buttonText: "Confirm",
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const Confirmation()));
            },
          )),
    );
  }
}
