import 'package:flutter/material.dart';

import '../services/constants.dart';

// class ButtonSectionHobieSpringWidget extends StatelessWidget {
//   const ButtonSectionHobieSpringWidget({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 0.0, right: 0.0, top: kButtonRowSpacingTop, bottom: 0.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           Column(
//             mainAxisSize: MainAxisSize.min,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Container(
//                 margin: const EdgeInsets.only(top: 8),
//                 child: SizedBox(
//                   width: kWidthResultsElevatedButton,
//                   height: kHeightResultsElevatedButton,
//                   child: buildElevatedButtonGetResults(context),
//                 ),
//               ),
//             ], //children
//           ),
//         ],
//       ),
//     );
//   }
// }

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
