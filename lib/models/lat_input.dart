import 'package:flutter/material.dart';
import '../services/constants.dart';

class LatInputTextFieldClass extends StatelessWidget {
  const LatInputTextFieldClass({
    super.key,
    required this.latitudeTextInputValue,
  });

  final TextEditingController latitudeTextInputValue;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: kTextStyleFieldDataInput,
      autofocus: true,
      keyboardType: TextInputType.text,
      showCursor: true,
      controller: latitudeTextInputValue,
      textAlign: TextAlign.left,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(kDarkBlue),
        prefixIcon: const Icon(
          Icons.pin_drop,
          size: 40.0,
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        hintText: 'Enter Lat in Dec Degree:',
        hintStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.normal, fontStyle: FontStyle.italic, fontSize: 14),
      ),
    );
  }
} //class
