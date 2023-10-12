import 'package:flutter/material.dart';
import 'package:real_time_wind_three/models/latitude_model.dart';
import 'package:real_time_wind_three/models/location_arguments.dart';
import 'package:real_time_wind_three/models/longitude_model.dart';
import 'package:real_time_wind_three/models/temp_class.dart';
import 'package:real_time_wind_three/models/weather_data_list.dart';
import 'package:real_time_wind_three/models/wind_speed_class.dart';
import 'package:real_time_wind_three/screens/settings_screen.dart';
import '../services/constants.dart';
import '../services/network_services.dart';

class ResultsScreen extends StatefulWidget {
  static String id = 'results_screen';
  const ResultsScreen({Key? key}) : super(key: key);

  @override
  State<ResultsScreen> createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {
  WeatherDataList weatherDataList = WeatherDataList();
  LatitudeDataValue latitudeDataValue = LatitudeDataValue();
  LongitudeDataValue longitudeDataValue = LongitudeDataValue();
  TemperatureSelection temperatureSelection = TemperatureSelection();
  WindSpeedSelection windSpeedSelection = WindSpeedSelection();
  static int resetResultsScreenCount = 0;
  static int resetWidgetCount = 0;
  static List<dynamic> weatherResultsList = [];

  Future<dynamic> getLocationWeather(
      String tempLat,
      String tempLon,
      int resetWidgetCountValue,
      int tempSelectionValue,
      int speedSelectionValue) async {
    final String unitsChoice;
    final lat = tempLat;
    final lon = tempLon;
    resetWidgetCount = resetWidgetCountValue;
    final tempChoiceValue = tempSelectionValue;
    final speedChoiceValue = speedSelectionValue;

    if (tempChoiceValue == 0) {
      unitsChoice = 'imperial';
    } else {
      unitsChoice = 'metric';
    }

    /// Get location data
    ///&units=metric change the temperature metric
    if (resetWidgetCount == 1 && resetResultsScreenCount < 1) {
      NetworkData networkHelper = NetworkData(
          '$weatherApiUrl?lat=$lat&lon=$lon&appid=$apiKey&units=$unitsChoice');
      var tempApiValue =
          ('$weatherApiUrl?lat=$lat&lon=$lon&appid=$apiKey&units=$unitsChoice');
      print('This is the API call: $tempApiValue');
      var weatherData = await networkHelper.getData();
      // print('This is the weatherData in the WeatherModel Class: $weatherData');

      /// set the variables
      weatherDataList.setCityWeatherDataValue = weatherData['name'];
      weatherDataList.setCountryWeatherDataValue =
          weatherData['sys']['country'];
      weatherDataList.setWindSpeedWeatherDataValue =
          weatherData['wind']['speed'];
      weatherDataList.setWindGustWeatherDataValue = weatherData['wind']['gust'];
      weatherDataList.setWindDirectionWeatherDataValue =
          weatherData['wind']['deg'];
      weatherDataList.setTemperatureWeatherDataValue =
          weatherData['main']['temp'];
      weatherDataList.setPressureWeatherDataValue =
          weatherData['main']['pressure'];

      /// build the list
      setState(() {
        weatherResultsList
            .clear(); // this allows the user to go back to the input screen, enter new data, and get new results
        weatherResultsList.add('Latitude: $lat');
        weatherResultsList.add('Longitude: $lon');
        weatherResultsList
            .add('Nearby City: ${weatherDataList.getCityWeatherDataValue}');
        weatherResultsList
            .add('Country: ${weatherDataList.getCountryWeatherDataValue}');

        /// wind speed
        if (speedChoiceValue == 0 && tempChoiceValue == 0) {
          weatherResultsList.add(
              'Wind Speed: ${weatherDataList.getWindSpeedWeatherDataValue} mph');
        }
        if (speedChoiceValue == 0 && tempChoiceValue == 1) {
          weatherResultsList.add(
              'Wind Speed: ${weatherDataList.getWindSpeedWeatherDataValue} m/s');
        }

        if (speedChoiceValue == 1 && tempChoiceValue == 0) {
          double tempSpeedKnots =
              weatherDataList.getWindSpeedWeatherDataValue ?? 0;
          tempSpeedKnots = tempSpeedKnots * 0.868976;
          weatherResultsList
              .add('Wind Speed: ${tempSpeedKnots.toStringAsFixed(1)} knots');
        }
        if (speedChoiceValue == 1 && tempChoiceValue == 1) {
          double tempMeterPerSecond =
              weatherDataList.getWindSpeedWeatherDataValue ?? 0;
          tempMeterPerSecond = tempMeterPerSecond * 1.943844;
          weatherResultsList.add(
              'Wind Speed: ${tempMeterPerSecond.toStringAsFixed(1)} knots');
        }

        /// wind gusts
        if (speedChoiceValue == 0 && tempChoiceValue == 0) {
          weatherResultsList.add(
              'Wind Gust: ${weatherDataList.getWindGustWeatherDataValue} mph');
        }
        if (speedChoiceValue == 0 && tempChoiceValue == 1) {
          weatherResultsList.add(
              'Wind Gust: ${weatherDataList.getWindGustWeatherDataValue} meter/sec');
        }
        if (speedChoiceValue == 1 && tempChoiceValue == 0) {
          double tempGustSpeedKnots =
              weatherDataList.getWindGustWeatherDataValue ?? 0;
          tempGustSpeedKnots = tempGustSpeedKnots * 0.868976;
          weatherResultsList
              .add('Wind Gust: ${tempGustSpeedKnots.toStringAsFixed(1)} knots');
        }
        if (speedChoiceValue == 1 && tempChoiceValue == 1) {
          double tempGustMeterPerSecond =
              weatherDataList.getWindGustWeatherDataValue ?? 0;
          tempGustMeterPerSecond = tempGustMeterPerSecond * 1.943844;
          weatherResultsList.add(
              'Wind Gust: ${tempGustMeterPerSecond.toStringAsFixed(1)} knots');
        }

        int tempWeatherDegreeValue =
            weatherDataList.getWindDirectionWeatherDataValue;
        if (tempWeatherDegreeValue < 361) {
          if (tempWeatherDegreeValue >= 349)
            weatherResultsList.add(
                'Wind Direction: ${weatherDataList.getWindDirectionWeatherDataValue} \u00B0 North');
        }
        if (tempWeatherDegreeValue < 11) {
          if (tempWeatherDegreeValue >= 0)
            weatherResultsList.add(
                'Wind Direction: ${weatherDataList.getWindDirectionWeatherDataValue} \u00B0 North');
        }
        if (tempWeatherDegreeValue < 34) {
          if (tempWeatherDegreeValue >= 11)
            weatherResultsList.add(
                'Wind Direction: ${weatherDataList.getWindDirectionWeatherDataValue} \u00B0 N/NE');
        }
        if (tempWeatherDegreeValue < 56) {
          if (tempWeatherDegreeValue >= 34)
            weatherResultsList.add(
                'Wind Direction: ${weatherDataList.getWindDirectionWeatherDataValue} \u00B0 NE');
        }
        if (tempWeatherDegreeValue < 78) {
          if (tempWeatherDegreeValue >= 56)
            weatherResultsList.add(
                'Wind Direction: ${weatherDataList.getWindDirectionWeatherDataValue} \u00B0 E/NE');
        }
        if (tempWeatherDegreeValue < 101) {
          if (tempWeatherDegreeValue >= 78)
            weatherResultsList.add(
                'Wind Direction: ${weatherDataList.getWindDirectionWeatherDataValue} \u00B0 East');
        }
        if (tempWeatherDegreeValue < 123) {
          if (tempWeatherDegreeValue >= 101)
            weatherResultsList.add(
                'Wind Direction: ${weatherDataList.getWindDirectionWeatherDataValue} \u00B0 E/SE');
        }
        if (tempWeatherDegreeValue < 146) {
          if (tempWeatherDegreeValue >= 123)
            weatherResultsList.add(
                'Wind Direction: ${weatherDataList.getWindDirectionWeatherDataValue} \u00B0 SE');
        }
        if (tempWeatherDegreeValue < 168) {
          if (tempWeatherDegreeValue >= 146)
            weatherResultsList.add(
                'Wind Direction: ${weatherDataList.getWindDirectionWeatherDataValue} \u00B0 S/SE');
        }
        if (tempWeatherDegreeValue < 191) {
          if (tempWeatherDegreeValue >= 168)
            weatherResultsList.add(
                'Wind Direction: ${weatherDataList.getWindDirectionWeatherDataValue} \u00B0 South');
        }
        if (tempWeatherDegreeValue < 213) {
          if (tempWeatherDegreeValue >= 191)
            weatherResultsList.add(
                'Wind Direction: ${weatherDataList.getWindDirectionWeatherDataValue} \u00B0 S/SW');
        }
        if (tempWeatherDegreeValue < 236) {
          if (tempWeatherDegreeValue >= 213)
            weatherResultsList.add(
                'Wind Direction: ${weatherDataList.getWindDirectionWeatherDataValue} \u00B0 SW');
        }
        if (tempWeatherDegreeValue < 258) {
          if (tempWeatherDegreeValue >= 236)
            weatherResultsList.add(
                'Wind Direction: ${weatherDataList.getWindDirectionWeatherDataValue} \u00B0 W/SW');
        }
        if (tempWeatherDegreeValue < 281) {
          if (tempWeatherDegreeValue >= 258)
            weatherResultsList.add(
                'Wind Direction: ${weatherDataList.getWindDirectionWeatherDataValue} \u00B0 West');
        }
        if (tempWeatherDegreeValue < 304) {
          if (tempWeatherDegreeValue >= 281)
            weatherResultsList.add(
                'Wind Direction: ${weatherDataList.getWindDirectionWeatherDataValue} \u00B0 W/NW');
        }
        if (tempWeatherDegreeValue < 327) {
          if (tempWeatherDegreeValue >= 304)
            weatherResultsList.add(
                'Wind Direction: ${weatherDataList.getWindDirectionWeatherDataValue} \u00B0 W/NW');
        }
        if (tempWeatherDegreeValue < 349) {
          if (tempWeatherDegreeValue >= 327)
            weatherResultsList.add(
                'Wind Direction: ${weatherDataList.getWindDirectionWeatherDataValue} \u00B0 W/NW');
        }

        ///Temperature
        if (tempChoiceValue == 0) {
          weatherResultsList.add(
              'Temperature: ${weatherDataList.getTemperatureWeatherDataValue} \u2109');
        }
        if (tempChoiceValue == 1) {
          weatherResultsList.add(
              'Temperature: ${weatherDataList.getTemperatureWeatherDataValue} \u2103');
        }
        weatherResultsList.add(
            'Pressure: ${weatherDataList.getPressureWeatherDataValue} millibars');
      });

      /// adjust counts to avoid the widget rebuilding multiple times
      /// Would like to figure out a different method but not sure how yet
      resetResultsScreenCount++;
      resetWidgetCount = 0;
    }
  } //getLocationWeather

  @override
  void initState() {
    // getLocationWeather();
    resetResultsScreenCount = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final inputLocationAndSelectionValues =
        ModalRoute.of(context)?.settings.arguments as LocationArguments;

    /// extract the data from the data input screen passed via that LocationArguments
    /// data passed as a list and this is the order 0,1,2,3,4
    final lat = inputLocationAndSelectionValues.latitudeLocation; // 0
    final lon = inputLocationAndSelectionValues.longitudeLocation; // 1
    int resetWidgetCount =
        inputLocationAndSelectionValues.resetWidgetCount; // 2
    final tempSelectionValue = // 3
        inputLocationAndSelectionValues.tempSelectionValue;
    final speedSelectionValue = // 4
        inputLocationAndSelectionValues.speedSelectionValue;
    final lakeName = inputLocationAndSelectionValues.lakeNameValue;

    /// get the openweathermap data
    getLocationWeather(lat, lon, resetWidgetCount, tempSelectionValue,
        speedSelectionValue); // list order 0,1,2,3,4

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: const Color(kDarkestBlue),
        title: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            lakeName,
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
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  'images/OceanBackgroundWithOutBackgroundImage.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(top: 8),
                child: Center(
                  child: SizedBox(
                    width: kWidthElevatedButton,
                    height: kHeightElevatedButton,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                            if (states.contains(MaterialState.pressed)) {
                              return const Color(kLightestBlue);
                            }
                            return const Color(kDarkBlue);
                          },
                        ),
                      ),
                      onPressed: () {
                        resetResultsScreenCount = 0;
                        getLocationWeather(lat, lon, 1, tempSelectionValue,
                            speedSelectionValue);
                      },
                      child: const Text(
                        'Update Data',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: kFontTypeForApp,
                            color: Color(kWhiteHexValue)),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.separated(
                    itemCount: weatherResultsList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: kStyleBoxDecoration,
                          height: kContainerHeight,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              weatherResultsList[index].toString(),
                              style: const TextStyle(
                                  color: Color(kFontColor),
                                  fontFamily: kFontTypeForApp,
                                  fontSize: kContainerFontHeight,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      );
                    }, //separatorBuilder: (BuildContext context, int index) => const Divider(height: 25.0,),
                    separatorBuilder: (context, int index) => const Divider(
                      height: 10.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  } //Widget
} //class
