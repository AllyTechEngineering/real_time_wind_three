import 'package:flutter/material.dart';

import '../services/constants.dart';

class LonIInputTextFieldClass extends StatelessWidget {
  const LonIInputTextFieldClass({
    super.key,
    required this.longitudeTextInputValue,
  });

  final TextEditingController longitudeTextInputValue;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: kTextStyleFieldDataInput,
      autofocus: true,
      keyboardType: TextInputType.text,
      showCursor: true,
      controller: longitudeTextInputValue,
      textAlign: TextAlign.left,
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(kDarkBlue),
        prefixIcon: Icon(
          Icons.pin_drop,
          size: 40.0,
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        hintText: 'Enter Lon in ( - ) Dec Degree:',
        hintStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.normal, fontStyle: FontStyle.italic, fontSize: 14),
      ),
    );
  }
}
