import 'package:real_time_wind_three/models/wind_speed_class.dart';
import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../services/constants.dart';
class SpeedSelectToggleSwitch extends StatelessWidget {
  const SpeedSelectToggleSwitch({
    super.key,
    required this.windSpeedSelection,
  });

  final WindSpeedSelection windSpeedSelection;

  @override
  Widget build(BuildContext context) {
    return ToggleSwitch(
      borderColor: [Color(kLightestBlue)],
      borderWidth: 2.0,
      minWidth: 70.0,
      minHeight: 30.0,
      fontSize: 16.0,
      initialLabelIndex: 0,
      activeBgColor: [Color(kDarkBlue)],
      activeFgColor: Colors.white,
      inactiveBgColor: Colors.grey,
      inactiveFgColor: Colors.grey[900],
      totalSwitches: 2,
      labels: ['mph', 'kt'],
      onToggle: (index) {
        if (index == 0) {
          windSpeedSelection.setWindSpeedChoice = 0;
        } else {
          windSpeedSelection.setWindSpeedChoice = 1;
        }
      },
    );
  } //Widget
} //class SpeedSelectToggleSwitch