import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/colors/colors.dart';
import '../../../../core/widgets/corewidgets.dart';
import '../../../review/presentation/pages/review_summary.dart';
import '../provider/select_package.dart';
import '../widgets/rounded_dropdown.dart';

class Package extends StatefulWidget {
  const Package({super.key});

  @override
  State<Package> createState() => _PackageState();
}

class _PackageState extends State<Package> {
  @override
  void initState() {
    super.initState();
    context.read<SelectPackage>().getPackage();
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
                        "Select Package",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              )),
          body: ListView(children: [
            const Padding(
              padding: EdgeInsets.only(top: 16.0, left: 16, right: 16),
              child: Text("Select Duration",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: RoundedDropdown(),
            ),
            const Padding(
                padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
                child: Text("Select Package",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16))),
            Consumer<SelectPackage>(builder: (context, provider, _) {
              return provider.package.isEmpty
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : SizedBox(
                      height: 500,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                        child: ListView.builder(
                          itemCount: provider.package
                              .length, // Replace with the number of items you want in the list
                          itemBuilder: (BuildContext context, int index) {
                            IconData icon = Icons.message;
                            String subText = "Chat with Doctor";
                            switch (index) {
                              case 0:
                                icon = Icons.message;
                                subText = "Chat with Doctor";
                                break;
                              case 1:
                                icon = Icons.call;
                                subText = "Voice call with Doctor";
                                break;
                              case 2:
                                icon = Icons.video_call;
                                subText = "Video call with Doctor";
                                break;
                              case 3:
                                icon = Icons.person;
                                subText = "In Person visit with doctor";
                                break;
                            }
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      10.0), // Adjust the radius as needed
                                  border: Border.all(
                                    color: Colors.grey.withOpacity(0.3),
                                  ),
                                ),
                                child: Card(
                                  elevation: 0,
                                  child: ListTile(
                                    onTap: () {
                                      provider.setPackageSelected(index);
                                    },
                                    title: Row(
                                      children: <Widget>[
                                        Container(
                                          width: 60,
                                          height: 60,
                                          decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Color.fromRGBO(
                                                  231, 240, 254, 1)),
                                          child: Icon(
                                            icon,
                                            size: 20,
                                            color: primaryColor,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                provider.package[index],
                                                style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              const SizedBox(
                                                height: 8,
                                              ),
                                              Text(
                                                subText,
                                                style: const TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 12),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ), // Replace with your item's title
                                    trailing: Radio<String>(
                                      groupValue: provider.package[index],
                                      value: provider.isSelected,
                                      onChanged: (value) {
                                        provider.setPackageSelected(index);
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    );
            }),
          ]),
          bottomNavigationBar: BottomBar(
            buttonText: "Next",
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ReviewSummary()));
            },
          )),
    );
  }
}
