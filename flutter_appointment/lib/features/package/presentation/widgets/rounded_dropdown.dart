import 'package:flutter/material.dart';

class RoundedDropdown extends StatefulWidget {
  @override
  _RoundedDropdownState createState() => _RoundedDropdownState();
}

class _RoundedDropdownState extends State<RoundedDropdown> {
  String _selectedItem = 'Option 1';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius:
            BorderRadius.circular(10.0), // Adjust the radius as needed
        border: Border.all(color: Colors.grey),
      ),
      child: DropdownButton<String>(
        underline: const SizedBox(),
        value: _selectedItem,
        onChanged: (newValue) {
          setState(() {
            _selectedItem = newValue!;
          });
        },
        items: <String>['Option 1', 'Option 2', 'Option 3', 'Option 4']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
