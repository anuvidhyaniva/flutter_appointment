import 'package:flutter/material.dart';

class PackageOptions extends StatefulWidget {
  @override
  _PackageOptionsState createState() => _PackageOptionsState();
}

class _PackageOptionsState extends State<PackageOptions> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.blue, // Change this to your desired avatar background color
        ),
        child: Icon(Icons.person, color: Colors.white), // Replace with your desired icon
      ),
      title: Text('List Item'), // Replace with your item's title
      trailing: Radio<bool>(
        groupValue: true,
        value: isSelected,
        onChanged: (value) {
          setState(() {
            isSelected = value!;
          });
        },
      ),
    );
  }
}
