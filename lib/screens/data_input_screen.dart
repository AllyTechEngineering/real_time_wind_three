import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show TargetPlatform;
import 'package:real_time_wind_three/models/latitude_model.dart';
import 'package:real_time_wind_three/models/location_arguments.dart';
import 'package:real_time_wind_three/models/longitude_model.dart';
import 'package:real_time_wind_three/models/temp_class.dart';
import 'package:real_time_wind_three/models/wind_speed_class.dart';
import 'package:real_time_wind_three/screens/results_screen.dart';
import 'package:real_time_wind_three/screens/settings_screen.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../models/lat_input.dart';
import '../models/lon_input.dart';
import '../models/speed_select.dart';
import '../models/temperature_select.dart';
import '../services/constants.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DataInputScreen extends StatefulWidget {
  const DataInputScreen({super.key});

  @override
  State<DataInputScreen> createState() => _DataInputScreenState();
}

class _DataInputScreenState extends State<DataInputScreen> {
  /// this is how you set an initial value for text input. However, cannot use hint text.
  // final latitudeTextInputValue = TextEditingController()..text = '39.5668';
  // final longitudeTextInputValue = TextEditingController()..text = '-84.7446';
  final latitudeTextInputValue = TextEditingController();
  final longitudeTextInputValue = TextEditingController();
  TemperatureSelection temperatureSelection = TemperatureSelection();
  WindSpeedSelection windSpeedSelection = WindSpeedSelection();
  LatitudeDataValue latitudeDataValue = LatitudeDataValue();
  LongitudeDataValue longitudeDataValue = LongitudeDataValue();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    longitudeTextInputValue.dispose();
    latitudeTextInputValue.dispose();
    super.dispose();
  }

  late String lat = 'default';
  late String lon = 'default';
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Title',
      home: Scaffold(
        backgroundColor: const Color(kScaffoldColor),
        appBar: AppBar(
          backgroundColor: const Color(kDarkestBlue),
          title: const FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              kTitleText,
              style: kTextStyleForAppBar,
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.settings,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pushNamed(context, SettingsScreen.id);
              },
            ),
          ],
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/OceanBackgroundWithOutBackgroundImage.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: kEdgeInsetValue8484,
            child: ListView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: kEdgeInsetValue8480,
                      child: const FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Center(
                          child: Text(
                            'Enter Lat & Lon of The Location',
                            softWrap: true,
                            style: kTextStyleExplainText,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 10.0, 8.0, 0.0),
                      child: LatInputTextFieldClass(latitudeTextInputValue: latitudeTextInputValue),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 10.0, 8.0, 0.0),
                      child: LonIInputTextFieldClass(longitudeTextInputValue: longitudeTextInputValue),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(8.0, 10.0, 8.0, 0.0),
                            child: Column(
                              children: [
                                TemperatureSelectToggleSwitch(temperatureSelection: temperatureSelection),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(8.0, 10.0, 8.0, 0.0),
                            child: Column(
                              children: [
                                SpeedSelectToggleSwitch(windSpeedSelection: windSpeedSelection),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.fromLTRB(8.0, 10.0, 8.0, 10.0),
                      child: Center(
                        child: SizedBox(
                          width: kWidthElevatedButton,
                          height: kHeightElevatedButton,
                          child: ElevatedButton(
                            style: kStyleElevatedButtonOne,
                            onPressed: () {
                              List<String> tempList = [];
                              tempList.add(latitudeTextInputValue.text);
                              tempList.add(longitudeTextInputValue.text);
                              Navigator.pushNamed(context, ResultsScreen.id,
                                  arguments: LocationArguments(latitudeTextInputValue.text, longitudeTextInputValue.text, 1, temperatureSelection.getTempChoice,
                                      windSpeedSelection.getWindSpeedChoice));
                            },
                            child: const Text(
                              'Get Results',
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 20.0, 8.0, 0.0),
                      child: SizedBox(
                        height: 250,
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Image.asset(
                            'images/sailBoatBlackAndWhite.png',
                            width: kLogoWidthValue,
                            height: kLogoHeightValue,
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(8.0, 20.0, 8.0, 0.0),
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Center(
                          child: Text(
                            kCopyRightText,
                            softWrap: true,
                            style: TextStyle(
                              fontFamily: kFontTypeForApp,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: Color(kDarkestBlue),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ], //children
            ),
          ),
        ),
      ),
    );
  } //Widget
} //class
