import 'package:flutter/material.dart';

import '../services/constants.dart';

ElevatedButton buildElevatedButtonGetResults(BuildContext context) {
  return ElevatedButton(
    style: kStyleElevatedButtonOne,
    onPressed: () {
      // Navigator.pushNamed(context, SpringRaceResults.id);
    },
    child: const Text(
      'Spring Race Results',
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Color(kFontColor),
        fontSize: kFontHeightSmall,
      ),
    ),
  );
} //Widget Build
