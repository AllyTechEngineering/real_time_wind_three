import 'package:flutter/material.dart';
import 'package:real_time_wind_three/models/latitude_model.dart';
import 'package:real_time_wind_three/models/location_arguments.dart';
import 'package:real_time_wind_three/models/longitude_model.dart';
import 'package:real_time_wind_three/models/temp_class.dart';
import 'package:real_time_wind_three/models/wind_speed_class.dart';
import 'package:real_time_wind_three/screens/results_screen.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../services/constants.dart';

class DataInputScreen extends StatefulWidget {
  const DataInputScreen({super.key});

  @override
  State<DataInputScreen> createState() => _DataInputScreenState();
}

class _DataInputScreenState extends State<DataInputScreen> {
  final latitudeTextInputValue = TextEditingController();
  final longitudeTextInputValue = TextEditingController();
  TemperatureSelection temperatureSelection = TemperatureSelection();
  WindSpeedSelection windSpeedSelection = WindSpeedSelection();
  LatitudeDataValue latitudeDataValue = LatitudeDataValue();
  LongitudeDataValue longitudeDataValue = LongitudeDataValue();
  // WeatherDataList weatherDataList = WeatherDataList();
  // WeatherDataListResults weatherDataListResults = WeatherDataListResults();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    longitudeTextInputValue.dispose();
    latitudeTextInputValue.dispose();
    super.dispose();
  }

  // LatitudeDataValue latitudeDataValue = LatitudeDataValue();
  // LongitudeDataValue longitudeDataValue = LongitudeDataValue();
  late String lat = 'default';
  late String lon = 'default';
  @override
  void initState() {
    super.initState();
  }

  Widget buttonSectionOne = Padding(
    padding: const EdgeInsets.only(left: 0.0, right: 10.0, top: kButtonRowSpacingTop, bottom: 10.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[], //children
        ),
      ],
    ),
  );
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
              style: TextStyle(
                fontFamily: kFontTypeForApp,
                color: Color(kFontColor),
                fontSize: kAppBarFontHeight,
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/OceanBackgroundWithOutBackgroundImage.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ListView(children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 8.0),
                    child: TextField(
                      style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.normal),
                      autofocus: true,
                      controller: latitudeTextInputValue,
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
                        hintText: 'Enter Lat in Dec Degree:',
                        hintStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.normal, fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 20.0, 8.0, 8.0),
                    child: TextField(
                      style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.normal),
                      autofocus: true,
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
                        hintStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.normal, fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              ToggleSwitch(
                                borderColor: [Color(kLightestBlue)],
                                borderWidth: 2.0,
                                minWidth: 80.0,
                                minHeight: 40.0,
                                fontSize: 20.0,
                                initialLabelIndex: 0,
                                activeBgColor: [Color(kDarkBlue)],
                                activeFgColor: Colors.white,
                                inactiveBgColor: Colors.grey,
                                inactiveFgColor: Colors.grey[900],
                                totalSwitches: 2,
                                labels: ['\u2109', '\u2103'],
                                onToggle: (index) {
                                  if (index == 0) {
                                    temperatureSelection.setTempChoice = 0;
                                  } else {
                                    temperatureSelection.setTempChoice = 1;
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              ToggleSwitch(
                                borderColor: [Color(kLightestBlue)],
                                borderWidth: 2.0,
                                minWidth: 80.0,
                                minHeight: 40.0,
                                fontSize: 20.0,
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
                              ),
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
                    margin: const EdgeInsets.only(top: 8),
                    child: Center(
                      child: SizedBox(
                        width: kWidthElevatedButton,
                        height: kHeightElevatedButton,
                        child: ElevatedButton(
                          style: kStyleElevatedButton,
                          onPressed: () {
                            List<String> tempList = [];
                            tempList.add(latitudeTextInputValue.text);
                            tempList.add(longitudeTextInputValue.text);
                            // latitudeDataValue.setLatitudeValue = double.parse(latitudeTextInputValue.text);
                            // longitudeDataValue.setLongitudeValue = double.parse(longitudeTextInputValue.text);
                            // print('Inside of onPressed: getLatitudeValue${latitudeDataValue.getLatitudeValue}');
                            // print('Inside of onPressed: getLongitudeValue${longitudeDataValue.getLongitudeValue}');
                            Navigator.pushNamed(context, ResultsScreen.id,
                                arguments: LocationArguments(latitudeTextInputValue.text, longitudeTextInputValue.text, 1, temperatureSelection.getTempChoice,
                                    windSpeedSelection.getWindSpeedChoice));
                          },
                          child: const Text(
                            'Get Results',
                            // textAlign: TextAlign.center,
                            // style: TextStyle(
                            //   color: Color(kFontColor),
                            //   fontSize: kFontHeightSmall,
                            // ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // buttonSectionOne,
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SizedBox(
                      height: 300,
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
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  } //Widget
} //class
