import 'package:flutter/material.dart';
import 'package:real_time_wind_three/models/latitude_model.dart';
import 'package:real_time_wind_three/models/location_arguments.dart';
import 'package:real_time_wind_three/models/longitude_model.dart';
import 'package:real_time_wind_three/models/temp_class.dart';
import 'package:real_time_wind_three/models/wind_speed_class.dart';
import 'package:real_time_wind_three/screens/results_screen.dart';
import 'package:real_time_wind_three/screens/settings_screen.dart';
import '../controllers/lat_input.dart';
import '../controllers/lon_input.dart';
import '../controllers/speed_select.dart';
import '../controllers/temperature_select.dart';
import '../services/constants.dart';

class DataInputScreen extends StatefulWidget {
  static String id = 'data_input_screen';
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
          centerTitle: true,
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
              image: AssetImage(
                  'images/OceanBackgroundWithOutBackgroundImage.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: kEdgeInsetValue8484,
            child: ListView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              children: <Widget>[
                Column(
                  children: [
                    Padding(
                      padding: kEdgeInsetValue8480,
                      child: const FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Center(
                          child: Text(
                            'Boating Lakes in the Tri-State Area',
                            softWrap: true,
                            style: kTextStyleExplainText,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Padding(
                            padding:
                                const EdgeInsets.fromLTRB(8.0, 10.0, 8.0, 0.0),
                            child: Column(
                              children: [
                                TemperatureSelectToggleSwitch(
                                    temperatureSelection: temperatureSelection),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding:
                                const EdgeInsets.fromLTRB(8.0, 10.0, 8.0, 0.0),
                            child: Column(
                              children: [
                                SpeedSelectToggleSwitch(
                                    windSpeedSelection: windSpeedSelection),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(8.0, 10.0, 8.0, 10.0),
                      child: Center(
                        child: SizedBox(
                          width: kWidthElevatedButton,
                          height: kHeightElevatedButton,
                          child: ElevatedButton(
                            style: kStyleElevatedButtonOne,
                            onPressed: () {
                              // List<String> tempList = [];
                              // tempList.add(latitudeTextInputValue.text);
                              // tempList.add(longitudeTextInputValue.text);
                              Navigator.pushNamed(
                                context,
                                ResultsScreen.id,
                                arguments: LocationArguments(
                                    // latitudeTextInputValue.text,
                                    // longitudeTextInputValue.text,
                                    '39.5668',
                                    '-84.7446',
                                    1,
                                    temperatureSelection.getTempChoice,
                                    windSpeedSelection.getWindSpeedChoice,
                                    'Acton Lake'),
                              );
                            },
                            child: const Text(
                              'Acton Lake',
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(8.0, 10.0, 8.0, 10.0),
                      child: Center(
                        child: SizedBox(
                          width: kWidthElevatedButton,
                          height: kHeightElevatedButton,
                          child: ElevatedButton(
                            style: kStyleElevatedButtonOne,
                            onPressed: () {
                              // List<String> tempList = [];
                              // tempList.add(latitudeTextInputValue.text);
                              // tempList.add(longitudeTextInputValue.text);
                              Navigator.pushNamed(
                                context,
                                ResultsScreen.id,
                                arguments: LocationArguments(
                                    // latitudeTextInputValue.text,
                                    // longitudeTextInputValue.text,
                                    '39.4403',
                                    '-84.9997',
                                    1,
                                    temperatureSelection.getTempChoice,
                                    windSpeedSelection.getWindSpeedChoice,
                                    'Brookville Lake (Dam)'),
                              );
                            },
                            child: const Text(
                              'Brookville Lake (Dam)',
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(8.0, 10.0, 8.0, 10.0),
                      child: Center(
                        child: SizedBox(
                          width: kWidthElevatedButton,
                          height: kHeightElevatedButton,
                          child: ElevatedButton(
                            style: kStyleElevatedButtonOne,
                            onPressed: () {
                              // List<String> tempList = [];
                              // tempList.add(latitudeTextInputValue.text);
                              // tempList.add(longitudeTextInputValue.text);
                              Navigator.pushNamed(
                                context,
                                ResultsScreen.id,
                                arguments: LocationArguments(
                                    // latitudeTextInputValue.text,
                                    // longitudeTextInputValue.text,
                                    '39.3864',
                                    '-83.9030',
                                    1,
                                    temperatureSelection.getTempChoice,
                                    windSpeedSelection.getWindSpeedChoice,
                                    'Cowan Lake'),
                              );
                            },
                            child: const Text(
                              'Cowan Lake',
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(8.0, 10.0, 8.0, 10.0),
                      child: Center(
                        child: SizedBox(
                          width: kWidthElevatedButton,
                          height: kHeightElevatedButton,
                          child: ElevatedButton(
                            style: kStyleElevatedButtonOne,
                            onPressed: () {
                              // List<String> tempList = [];
                              // tempList.add(latitudeTextInputValue.text);
                              // tempList.add(longitudeTextInputValue.text);
                              Navigator.pushNamed(
                                context,
                                ResultsScreen.id,
                                arguments: LocationArguments(
                                    // latitudeTextInputValue.text,
                                    // longitudeTextInputValue.text,
                                    '39.5109',
                                    '-84.0141',
                                    1,
                                    temperatureSelection.getTempChoice,
                                    windSpeedSelection.getWindSpeedChoice,
                                    'Caesar Creek Lake'),
                              );
                            },
                            child: const Text(
                              'Caesar Creek Lake',
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(8.0, 10.0, 8.0, 10.0),
                      child: Center(
                        child: SizedBox(
                          width: kWidthElevatedButton,
                          height: kHeightElevatedButton,
                          child: ElevatedButton(
                            style: kStyleElevatedButtonOne,
                            onPressed: () {
                              // List<String> tempList = [];
                              // tempList.add(latitudeTextInputValue.text);
                              // tempList.add(longitudeTextInputValue.text);
                              Navigator.pushNamed(
                                context,
                                ResultsScreen.id,
                                arguments: LocationArguments(
                                    // latitudeTextInputValue.text,
                                    // longitudeTextInputValue.text,
                                    '39.968617428992864',
                                    '-83.73729374148644',
                                    //39.968617428992864, -83.73729374148644
                                    1,
                                    temperatureSelection.getTempChoice,
                                    windSpeedSelection.getWindSpeedChoice,
                                    'Clarence J Brown Reservoir'),
                              );
                            },
                            child: const Text(
                              'Clarence J Brown Reservoir',
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(8.0, 10.0, 8.0, 10.0),
                      child: Center(
                        child: SizedBox(
                          width: kWidthElevatedButton,
                          height: kHeightElevatedButton,
                          child: ElevatedButton(
                            style: kStyleElevatedButtonOne,
                            onPressed: () {
                              // List<String> tempList = [];
                              // tempList.add(latitudeTextInputValue.text);
                              // tempList.add(longitudeTextInputValue.text);
                              Navigator.pushNamed(
                                context,
                                ResultsScreen.id,
                                arguments: LocationArguments(
                                    // latitudeTextInputValue.text,
                                    // longitudeTextInputValue.text,
                                    '39.61577722293571',
                                    '-83.24271135698187',
                                    //39.61577722293571, -83.24271135698187
                                    1,
                                    temperatureSelection.getTempChoice,
                                    windSpeedSelection.getWindSpeedChoice,
                                    'Deer Creek Lake'),
                              );
                            },
                            child: const Text(
                              'Dear Creek Lake',
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(8.0, 10.0, 8.0, 10.0),
                      child: Center(
                        child: SizedBox(
                          width: kWidthElevatedButton,
                          height: kHeightElevatedButton,
                          child: ElevatedButton(
                            style: kStyleElevatedButtonOne,
                            onPressed: () {
                              // List<String> tempList = [];
                              // tempList.add(latitudeTextInputValue.text);
                              // tempList.add(longitudeTextInputValue.text);
                              Navigator.pushNamed(
                                context,
                                ResultsScreen.id,
                                arguments: LocationArguments(
                                    // latitudeTextInputValue.text,
                                    // longitudeTextInputValue.text,
                                    '39.0226',
                                    '-84.1502',
                                    1,
                                    temperatureSelection.getTempChoice,
                                    windSpeedSelection.getWindSpeedChoice,
                                    'East Fork Lake'),
                              );
                            },
                            child: const Text(
                              'East Fork Lake',
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(8.0, 10.0, 8.0, 10.0),
                      child: Center(
                        child: SizedBox(
                          width: kWidthElevatedButton,
                          height: kHeightElevatedButton,
                          child: ElevatedButton(
                            style: kStyleElevatedButtonOne,
                            onPressed: () {
                              // List<String> tempList = [];
                              // tempList.add(latitudeTextInputValue.text);
                              // tempList.add(longitudeTextInputValue.text);
                              Navigator.pushNamed(
                                context,
                                ResultsScreen.id,
                                arguments: LocationArguments(
                                    // latitudeTextInputValue.text,
                                    // longitudeTextInputValue.text,
                                    '39.27059778912283',
                                    '-83.39894513162949',
                                    //39.27059778912283, -83.39894513162949
                                    1,
                                    temperatureSelection.getTempChoice,
                                    windSpeedSelection.getWindSpeedChoice,
                                    'Paint Creek Lake'),
                              );
                            },
                            child: const Text(
                              'Paint Creek Lake',
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(8.0, 10.0, 8.0, 10.0),
                      child: Center(
                        child: SizedBox(
                          width: kWidthElevatedButton,
                          height: kHeightElevatedButton,
                          child: ElevatedButton(
                            style: kStyleElevatedButtonOne,
                            onPressed: () {
                              // List<String> tempList = [];
                              // tempList.add(latitudeTextInputValue.text);
                              // tempList.add(longitudeTextInputValue.text);
                              Navigator.pushNamed(
                                context,
                                ResultsScreen.id,
                                arguments: LocationArguments(
                                    // latitudeTextInputValue.text,
                                    // longitudeTextInputValue.text,
                                    '38.08162188921891',
                                    '-83.4890519592167',
                                    //38.08162188921891, -83.4890519592167
                                    1,
                                    temperatureSelection.getTempChoice,
                                    windSpeedSelection.getWindSpeedChoice,
                                    'Cave Run Lake KY'),
                              );
                            },
                            child: const Text(
                              'Cave Run Lake KY',
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(8.0, 10.0, 8.0, 10.0),
                      child: Center(
                        child: SizedBox(
                          width: kWidthElevatedButton,
                          height: kHeightElevatedButton,
                          child: ElevatedButton(
                            style: kStyleElevatedButtonOne,
                            onPressed: () {
                              // List<String> tempList = [];
                              // tempList.add(latitudeTextInputValue.text);
                              // tempList.add(longitudeTextInputValue.text);
                              Navigator.pushNamed(
                                context,
                                ResultsScreen.id,
                                arguments: LocationArguments(
                                    // latitudeTextInputValue.text,
                                    // longitudeTextInputValue.text,
                                    '38.00803516569071',
                                    '-85.26233661851447',
                                    //38.00803516569071, -85.26233661851447
                                    1,
                                    temperatureSelection.getTempChoice,
                                    windSpeedSelection.getWindSpeedChoice,
                                    'Taylorsville Lake KY'),
                              );
                            },
                            child: const Text(
                              'Taylorsville Lake KY',
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: kEdgeInsetValue8480,
                      child: const FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Center(
                          child: Text(
                            'For Other Lakes Enter Lat and Lon',
                            softWrap: true,
                            style: kTextStyleExplainText,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 10.0, 8.0, 0.0),
                      child: LatInputTextFieldClass(
                          latitudeTextInputValue: latitudeTextInputValue),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 10.0, 8.0, 0.0),
                      child: LonIInputTextFieldClass(
                          longitudeTextInputValue: longitudeTextInputValue),
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
                              Navigator.pushNamed(
                                context,
                                ResultsScreen.id,
                                arguments: LocationArguments(
                                    latitudeTextInputValue.text,
                                    longitudeTextInputValue.text,
                                    1,
                                    temperatureSelection.getTempChoice,
                                    windSpeedSelection.getWindSpeedChoice,
                                    'Manually Entered Lat/Lon Results'),
                              );
                            },
                            child: const Text(
                              'Press for Lat & Lon Results',
                              style: TextStyle(
                                fontSize: 10.0,
                              ),
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
