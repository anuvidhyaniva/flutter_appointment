import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/select_package.dart';

class RoundedDropdown extends StatefulWidget {
  @override
  _RoundedDropdownState createState() => _RoundedDropdownState();
}

class _RoundedDropdownState extends State<RoundedDropdown> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SelectPackage>(builder: (context, provider, _) {
      return Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius:
              BorderRadius.circular(10.0), // Adjust the radius as needed
          border: Border.all(
            color: Colors.grey.withOpacity(0.3),
          ),
        ),
        child: DropdownButton<String>(
          value: provider.selectedDuration,
          isExpanded: true,
          isDense: true,
          underline: const SizedBox(),
          onChanged: (newValue) {
            provider.setSelectedDuration(newValue!);
          },
          items:
              provider.duration.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      );
    });
  }
}
