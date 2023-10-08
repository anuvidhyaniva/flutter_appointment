import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  final void Function() onPressed;
  final String buttonText;
  final bool? isConfirmationPage;
  const BottomBar(
      {super.key,
      required this.onPressed,
      required this.buttonText,
      this.isConfirmationPage});

  @override
  Widget build(BuildContext context) {
    return Container(
        height:
            isConfirmationPage != null ? (isConfirmationPage! ? 140 : 80) : 80,
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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: SizedBox(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(
                  children: <Widget>[
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 15.0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                        ),
                        onPressed: onPressed,
                        child: Text(buttonText)),
                    Visibility(
                        visible: isConfirmationPage ?? false,
                        child: TextButton(
                            onPressed: onPressed,
                            child: const Text("Book Another")))
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
