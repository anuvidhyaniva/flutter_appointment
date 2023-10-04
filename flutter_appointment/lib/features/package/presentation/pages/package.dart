import 'package:flutter/material.dart';

import '../../../review/presentation/pages/review_summary.dart';
import '../widgets/package_options.dart';
import '../widgets/rounded_dropdown.dart';

class Package extends StatefulWidget {
  const Package({super.key});

  @override
  State<Package> createState() => _PackageState();
}

class _PackageState extends State<Package> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(children: [
        const Text("Select duration"),
        RoundedDropdown(),
        const Text("Select Package"),
        SizedBox(
          height: 500,
          child: ListView.builder(
            itemCount:
                4, // Replace with the number of items you want in the list
            itemBuilder: (BuildContext context, int index) {
              return PackageOptions();
            },
          ),
        ),
      ]),
      bottomNavigationBar: Container(
        height: 60,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20.0), // Top-left corner radius
            topRight: Radius.circular(20.0), // Top-right corner radius
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5), // Shadow color
              spreadRadius: 5, // Spread radius
              blurRadius: 7, // Blur radius
              offset: const Offset(0, 3), // Offset in the x and y direction
            ),
          ],
          color: Colors.white, // Container background color
        ),
        child: Center(
          child: ElevatedButton(
            child: const Text("Next"),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ReviewSummary()));
            },
          ),
        ),
      ),
    );
  }
}
