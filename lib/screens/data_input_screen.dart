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
              // scrollDirection: axisDirectionToAxis(AxisDirection.down),
              padding: EdgeInsets.zero,
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              children: <Widget>[
                Column(
                  children: [
                    Padding(
                      padding: kEdgeInsetValue8480,
                      child: const Column(
                        children: [
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Center(
                              child: Text(
                                'Sailing Lakes - Cincinnati Area',
                                softWrap: true,
                                style: kTextStyleExplainText,
                              ),
                            ),
                          ),
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Center(
                              child: Text(
                                'Select Imperial or Metric',
                                softWrap: true,
                                style: kTextStyleDataSettingsText,
                              ),
                            ),
                          ),
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Center(
                              child: Text(
                                'Default is F and mph',
                                softWrap: true,
                                style: kTextStyleDataSettingsText,
                              ),
                            ),
                          ),
                        ],
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
                    //Acton
                    Container(
                      margin: kEdgeInsetContainerValue8_2_8_2,
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
                                    kLakeNameDetailList[2],
                                    kLakeNameDetailList[3],
                                    1,
                                    //39.57230800090869, -84.74804993639334
                                    temperatureSelection.getTempChoice,
                                    windSpeedSelection.getWindSpeedChoice,
                                    kLakeNameDetailList[0]),
                              );
                            },
                            child: _lakeDetailMethod(
                                kLakeNameDetailList[0], kLakeNameDetailList[1]),
                          ),
                        ),
                      ),
                    ),
                    //Cowan
                    Container(
                      margin: kEdgeInsetContainerValue8_2_8_2,
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
                                    kLakeNameDetailList[6],
                                    kLakeNameDetailList[7],
                                    1,
                                    temperatureSelection.getTempChoice,
                                    windSpeedSelection.getWindSpeedChoice,
                                    kLakeNameDetailList[4]),
                              );
                            },
                            child: _lakeDetailMethod(
                                kLakeNameDetailList[4], kLakeNameDetailList[5]),
                          ),
                        ),
                      ),
                    ),
                    //St. Marys
                    Container(
                      margin: kEdgeInsetContainerValue8_2_8_2,
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
                                    kLakeNameDetailList[10],
                                    kLakeNameDetailList[11],
                                    1,
                                    temperatureSelection.getTempChoice,
                                    windSpeedSelection.getWindSpeedChoice,
                                    kLakeNameDetailList[8]),
                              );
                            },
                            child: _lakeDetailMethod(
                                kLakeNameDetailList[8], kLakeNameDetailList[9]),
                          ),
                        ),
                      ),
                    ),
                    //Indian
                    Container(
                      margin: kEdgeInsetContainerValue8_2_8_2,
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
                                    // latitudeTextInputValue.text,
                                    // longitudeTextInputValue.text,
                                    '40.495602371699455',
                                    '-83.89213690927512',
                                    // 40.495602371699455, -83.89213690927512
                                    1,
                                    temperatureSelection.getTempChoice,
                                    windSpeedSelection.getWindSpeedChoice,
                                    'Indian Lake OH'),
                              );
                            },
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Indian Lake OH',
                                  style: TextStyle(fontSize: kFontHeightMedium),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '5,104 Acres, No HP or Speed Limit*',
                                  style: TextStyle(fontSize: kFontHeightSmall),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    //Alum Creek Lake
                    Container(
                      margin: kEdgeInsetContainerValue8_2_8_2,
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
                                    '40.23521514514917',
                                    '-82.96878005661542',
                                    //40.23521514514917, -82.96878005661542
                                    1,
                                    temperatureSelection.getTempChoice,
                                    windSpeedSelection.getWindSpeedChoice,
                                    'Alum Creek Lake OH'),
                              );
                            },
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Alum Creek Lake OH',
                                  style: TextStyle(fontSize: kFontHeightMedium),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '3,269 Acres, No HP or Speed Limit*',
                                  style: TextStyle(fontSize: kFontHeightSmall),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    //Hoover Reservoir
                    Container(
                      margin: kEdgeInsetContainerValue8_2_8_2,
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
                                    '40.159819787299135',
                                    '-82.87455000814889',
                                    //40.159819787299135, -82.87455000814889
                                    1,
                                    temperatureSelection.getTempChoice,
                                    windSpeedSelection.getWindSpeedChoice,
                                    'Hoover Reservoir OH'),
                              );
                            },
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Hoover Reservoir OH',
                                  style: TextStyle(fontSize: kFontHeightMedium),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '3,272 Acres, 22\' length, 9.9HP & 10MPH Limit',
                                  style: TextStyle(fontSize: kFontHeightSmall),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    //Buckeye Lake
                    Container(
                      margin: kEdgeInsetContainerValue8_2_8_2,
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
                                    '39.928135541334036',
                                    '-82.46835505909164',
                                    //39.928135541334036, -82.46835505909164
                                    1,
                                    temperatureSelection.getTempChoice,
                                    windSpeedSelection.getWindSpeedChoice,
                                    'Buckeye Lake OH'),
                              );
                            },
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Buckeye Lake OH',
                                  style: TextStyle(fontSize: kFontHeightMedium),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '2,873 Acres, Unlimited HP and Speed Limit*',
                                  style: TextStyle(fontSize: kFontHeightSmall),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    //Caesar Creek
                    Container(
                      margin: kEdgeInsetContainerValue8_2_8_2,
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
                                    'Caesar Creek Lake OH'),
                              );
                            },
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Caesar Creek Lake OH',
                                  style: TextStyle(fontSize: kFontHeightMedium),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '2,830 Acres, Unlimited HP and Speed Limit*',
                                  style: TextStyle(fontSize: kFontHeightSmall),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    //Clarence J Brown
                    Container(
                      margin: kEdgeInsetContainerValue8_2_8_2,
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
                                    'Clarence J Brown Reservoir OH'),
                              );
                            },
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Clarence J. Brown Reservoir OH',
                                  style: TextStyle(fontSize: kFontHeightMedium),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '1,970 Acres, Unlimited HP and Speed Limit*',
                                  style: TextStyle(fontSize: kFontHeightSmall),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    //Deer Creek
                    Container(
                      margin: kEdgeInsetContainerValue8_2_8_2,
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
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Deer Creek Lake OH',
                                  style: TextStyle(fontSize: kFontHeightMedium),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '1,970 Acres, Unlimited HP and Speed Limit*',
                                  style: TextStyle(fontSize: kFontHeightSmall),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    //East Fork
                    Container(
                      margin: kEdgeInsetContainerValue8_2_8_2,
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
                                    'East Fork Lake OH'),
                              );
                            },
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'East Fork Lake OH',
                                  style: TextStyle(fontSize: kFontHeightMedium),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '2,160 Acres, Unlimited HP and Speed Limit*',
                                  style: TextStyle(fontSize: kFontHeightSmall),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    //Paint Creek
                    Container(
                      margin: kEdgeInsetContainerValue8_2_8_2,
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
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Paint Creek Lake OH',
                                  style: TextStyle(fontSize: kFontHeightMedium),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '1,190 Acres, Unlimited HP and Speed Limit*',
                                  style: TextStyle(fontSize: kFontHeightSmall),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    //Brookville
                    Container(
                      margin: kEdgeInsetContainerValue8_2_8_2,
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
                                    'Brookville Lake IN'),
                              );
                            },
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Brookville Lake IN',
                                  style: TextStyle(fontSize: kFontHeightMedium),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '5,260 Acres, Unlimited HP and Speed Limit*',
                                  style: TextStyle(fontSize: kFontHeightSmall),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    //Cave Run
                    Container(
                      margin: kEdgeInsetContainerValue8_2_8_2,
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
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Cave Run Lake KY',
                                  style: TextStyle(fontSize: kFontHeightMedium),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '8,270 Acres, Unlimited HP and Speed Limit*',
                                  style: TextStyle(fontSize: kFontHeightSmall),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    //Taylorsville
                    Container(
                      margin: kEdgeInsetContainerValue8_2_8_2,
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
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Taylorsville Lake KY',
                                  style: TextStyle(fontSize: kFontHeightMedium),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '3,050 Acres, Unlimited HP and Speed Limit*',
                                  style: TextStyle(fontSize: kFontHeightSmall),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    //Lake Monroe
                    Container(
                      margin: kEdgeInsetContainerValue8_2_8_2,
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
                                    '39.065017796737195',
                                    '-86.43970572383475',
                                    //39.065017796737195, -86.43970572383475
                                    1,
                                    temperatureSelection.getTempChoice,
                                    windSpeedSelection.getWindSpeedChoice,
                                    'Lake Monroe IN'),
                              );
                            },
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Lake Monroe IN',
                                  style: TextStyle(fontSize: kFontHeightMedium),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '10,750 Acres, Unlimited HP and Speed Limit*',
                                  style: TextStyle(fontSize: kFontHeightSmall),
                                ),
                              ],
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column _lakeDetailMethod(String lakeName, String lakeDetails) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          lakeName,
          style: const TextStyle(fontSize: kFontHeightMedium),
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          lakeDetails,
          style: const TextStyle(fontSize: kFontHeightSmall),
        ),
      ],
    );
  } //Column lakeDetailMethod
}
