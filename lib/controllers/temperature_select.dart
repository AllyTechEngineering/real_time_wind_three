import 'package:flutter/material.dart';
import 'package:real_time_wind_three/models/temp_class.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../services/constants.dart';

class TemperatureSelectToggleSwitch extends StatelessWidget {
  const TemperatureSelectToggleSwitch({
    super.key,
    required this.temperatureSelection,
  });

  final TemperatureSelection temperatureSelection;

  @override
  Widget build(BuildContext context) {
    return ToggleSwitch(
      borderColor: const [Color(kLightestBlue)],
      borderWidth: 2.0,
      minWidth: 70.0,
      minHeight: 30.0,
      fontSize: 20.0,
      initialLabelIndex: 0,
      activeBgColor: const [Color(kDarkBlue)],
      activeFgColor: Colors.white,
      inactiveBgColor: Colors.grey,
      inactiveFgColor: Colors.grey[900],
      totalSwitches: 2,
      labels: const ['\u2109', '\u2103'],
      onToggle: (index) {
        if (index == 0) {
          temperatureSelection.setTempChoice = 0;
        } else {
          temperatureSelection.setTempChoice = 1;
        }
      },
    );
  } //Widget
} //class TemperatureSelectToggleSwitch
