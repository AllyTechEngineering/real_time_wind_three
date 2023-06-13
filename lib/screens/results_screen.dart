import 'package:flutter/material.dart';
import 'package:real_time_wind_three/models/latitude_model.dart';
import 'package:real_time_wind_three/models/location_arguments.dart';
import 'package:real_time_wind_three/models/longitude_model.dart';
import 'package:real_time_wind_three/models/temp_class.dart';
import 'package:real_time_wind_three/models/weather_data_list.dart';
import 'package:real_time_wind_three/models/wind_speed_class.dart';

import '../models/weather_model.dart';
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

  Future<dynamic> getLocationWeather(String tempLat, String tempLon, int resetWidgetCountValue, int tempSelectionValue, int speedSelectionValue) async {
    final String unitsChoice;
    final lat = tempLat;
    final lon = tempLon;
    resetWidgetCount = resetWidgetCountValue;
    final tempChoiceValue = tempSelectionValue;
    final speedChoiceValue = speedSelectionValue;
    print('resetWidgetCount = $resetWidgetCount and resetResultsScreenCount = $resetResultsScreenCount');

    if (tempChoiceValue == 0) {
      unitsChoice = 'imperial';
    } else {
      unitsChoice = 'metric';
    }

    /// Get location data
    ///&units=metric change the temperature metric
    if (resetWidgetCount == 1 && resetResultsScreenCount < 1) {
      print('inside of if statement and at the entrance: resetWidgetCount = $resetWidgetCount and resetResultsScreenCount = $resetResultsScreenCount');
      NetworkData networkHelper = NetworkData('$weatherApiUrl?lat=$lat&lon=$lon&appid=$apiKey&units=$unitsChoice');
      var tempApiValue = ('$weatherApiUrl?lat=$lat&lon=$lon&appid=$apiKey&units=$unitsChoice');
      print('This is the API call: $tempApiValue');
      var weatherData = await networkHelper.getData();
      print('This is the weatherData in the WeatherModel Class: $weatherData');
      weatherDataList.setCityWeatherDataValue = weatherData['name'];
      weatherDataList.setCountryWeatherDataValue = weatherData['sys']['country'];
      weatherDataList.setWindSpeedWeatherDataValue = weatherData['wind']['speed'];
      weatherDataList.setWindGustWeatherDataValue = weatherData['wind']['gust'];
      weatherDataList.setWindDirectionWeatherDataValue = weatherData['wind']['deg'];
      weatherDataList.setTemperatureWeatherDataValue = weatherData['main']['temp'];
      weatherDataList.setPressureWeatherDataValue = weatherData['main']['pressure'];
      setState(() {
        weatherResultsList.clear();
        weatherResultsList.add('Latitude: ${lat}');
        print('getLatitudeWeatherDataValue ${lat}');
        weatherResultsList.add('Longitude: ${lon}');
        print('getLongitudeWeatherDataValue ${lon}');
        weatherResultsList.add('City: ${weatherDataList.getCityWeatherDataValue}');
        print('getCityWeatherDataValue ${weatherDataList.getCityWeatherDataValue}');
        weatherResultsList.add('Country: ${weatherDataList.getCountryWeatherDataValue}');
        print('getCountryWeatherDataValue ${weatherDataList.getCountryWeatherDataValue}');

        /// wind speed
        if (speedChoiceValue == 0 && tempChoiceValue == 0) {
          weatherResultsList.add('Wind Speed: ${weatherDataList.getWindSpeedWeatherDataValue} mph');
          print(' if (speedChoiceValue == 0 && tempChoiceValue == 0) ${weatherDataList.getWindSpeedWeatherDataValue}');
        }
        if (speedChoiceValue == 0 && tempChoiceValue == 1) {
          weatherResultsList.add('Wind Speed: ${weatherDataList.getWindSpeedWeatherDataValue} meter/sec');
          print(' if (speedChoiceValue == 0 && tempChoiceValue == 1) ${weatherDataList.getWindSpeedWeatherDataValue}');
        }
        if (speedChoiceValue == 1 && tempChoiceValue == 0) {
          double tempSpeedKnots = weatherDataList.getWindSpeedWeatherDataValue;
          print('tempSpeedKnots = $tempSpeedKnots');
          tempSpeedKnots = tempSpeedKnots * 0.868976;
          print('tempSpeedKnots * 0.868976 = $tempSpeedKnots');
          weatherResultsList.add('Wind Speed: ${tempSpeedKnots.toStringAsFixed(1)} knots');
          print(' if (speedChoiceValue == 1 && tempChoiceValue == 0) ${tempSpeedKnots.toStringAsFixed(1)}');
        }
        if (speedChoiceValue == 1 && tempChoiceValue == 1) {
          double tempMeterPerSecond = weatherDataList.getWindSpeedWeatherDataValue;
          tempMeterPerSecond = tempMeterPerSecond * 1.943844;
          weatherResultsList.add('Wind Speed: ${tempMeterPerSecond.toStringAsFixed(1)} knots');
          print(' if (speedChoiceValue == 1 && tempChoiceValue == 1) ${tempMeterPerSecond.toStringAsFixed(1)}');
        }

        /// wind gusts
        if (speedChoiceValue == 0 && tempChoiceValue == 0) {
          weatherResultsList.add('Wind Gust: ${weatherDataList.getWindGustWeatherDataValue} mph');
        }
        if (speedChoiceValue == 0 && tempChoiceValue == 1) {
          weatherResultsList.add('Wind Gust: ${weatherDataList.getWindGustWeatherDataValue} meter/sec');
        }
        if (speedChoiceValue == 1 && tempChoiceValue == 0) {
          double tempGustSpeedKnots = weatherDataList.getWindGustWeatherDataValue;
          tempGustSpeedKnots = tempGustSpeedKnots * 0.868976;
          weatherResultsList.add('Wind Gust: ${tempGustSpeedKnots.toStringAsFixed(1)} knots');
        }
        if (speedChoiceValue == 1 && tempChoiceValue == 1) {
          double tempGustMeterPerSecond = weatherDataList.getWindGustWeatherDataValue;
          tempGustMeterPerSecond = tempGustMeterPerSecond * 1.943844;
          weatherResultsList.add('Wind Speed: ${tempGustMeterPerSecond.toStringAsFixed(1)} knots');
        }

        int tempWeatherDegreeValue = weatherDataList.getWindDirectionWeatherDataValue;
        if (tempWeatherDegreeValue < 361) {
          if (tempWeatherDegreeValue > 349) weatherResultsList.add('Wind Direction: ${weatherDataList.getWindDirectionWeatherDataValue} \u00B0 North');
        }
        if (tempWeatherDegreeValue < 11) {
          if (tempWeatherDegreeValue > 0) weatherResultsList.add('Wind Direction: ${weatherDataList.getWindDirectionWeatherDataValue} \u00B0 North');
        }
        if (tempWeatherDegreeValue < 34) {
          if (tempWeatherDegreeValue > 11) weatherResultsList.add('Wind Direction: ${weatherDataList.getWindDirectionWeatherDataValue} \u00B0 N/NE');
        }
        if (tempWeatherDegreeValue < 56) {
          if (tempWeatherDegreeValue > 33) weatherResultsList.add('Wind Direction: ${weatherDataList.getWindDirectionWeatherDataValue} \u00B0 NE');
        }
        if (tempWeatherDegreeValue < 78) {
          if (tempWeatherDegreeValue > 56) weatherResultsList.add('Wind Direction: ${weatherDataList.getWindDirectionWeatherDataValue} \u00B0 E/NE');
        }
        if (tempWeatherDegreeValue < 101) {
          if (tempWeatherDegreeValue > 78) weatherResultsList.add('Wind Direction: ${weatherDataList.getWindDirectionWeatherDataValue} \u00B0 East');
        }
        if (tempWeatherDegreeValue < 123) {
          if (tempWeatherDegreeValue > 101) weatherResultsList.add('Wind Direction: ${weatherDataList.getWindDirectionWeatherDataValue} \u00B0 E/SE');
        }
        if (tempWeatherDegreeValue < 146) {
          if (tempWeatherDegreeValue > 123) weatherResultsList.add('Wind Direction: ${weatherDataList.getWindDirectionWeatherDataValue} \u00B0 SE');
        }
        if (tempWeatherDegreeValue < 198) {
          if (tempWeatherDegreeValue > 146) weatherResultsList.add('Wind Direction: ${weatherDataList.getWindDirectionWeatherDataValue} \u00B0 S/SE');
        }
        if (tempWeatherDegreeValue < 191) {
          if (tempWeatherDegreeValue > 168) weatherResultsList.add('Wind Direction: ${weatherDataList.getWindDirectionWeatherDataValue} \u00B0 South');
        }
        if (tempWeatherDegreeValue < 213) {
          if (tempWeatherDegreeValue > 191) weatherResultsList.add('Wind Direction: ${weatherDataList.getWindDirectionWeatherDataValue} \u00B0 S/SW');
        }
        if (tempWeatherDegreeValue < 236) {
          if (tempWeatherDegreeValue > 213) weatherResultsList.add('Wind Direction: ${weatherDataList.getWindDirectionWeatherDataValue} \u00B0 SW');
        }
        if (tempWeatherDegreeValue < 258) {
          if (tempWeatherDegreeValue > 236) weatherResultsList.add('Wind Direction: ${weatherDataList.getWindDirectionWeatherDataValue} \u00B0 W/SW');
        }
        if (tempWeatherDegreeValue < 281) {
          if (tempWeatherDegreeValue > 258) weatherResultsList.add('Wind Direction: ${weatherDataList.getWindDirectionWeatherDataValue} \u00B0 West');
        }
        if (tempWeatherDegreeValue < 304) {
          if (tempWeatherDegreeValue > 281) weatherResultsList.add('Wind Direction: ${weatherDataList.getWindDirectionWeatherDataValue} \u00B0 W/NW');
        }
        if (tempWeatherDegreeValue < 327) {
          if (tempWeatherDegreeValue > 303) weatherResultsList.add('Wind Direction: ${weatherDataList.getWindDirectionWeatherDataValue} \u00B0 W/NW');
        }
        if (tempWeatherDegreeValue < 349) {
          if (tempWeatherDegreeValue > 327) weatherResultsList.add('Wind Direction: ${weatherDataList.getWindDirectionWeatherDataValue} \u00B0 W/NW');
        }

        ///Temperature
        if (tempChoiceValue == 0) {
          weatherResultsList.add('Temperature: ${weatherDataList.getTemperatureWeatherDataValue} \u2109');
        }
        if (tempChoiceValue == 1) {
          weatherResultsList.add('Temperature: ${weatherDataList.getTemperatureWeatherDataValue} \u2103');
        }
        weatherResultsList.add('Pressure: ${weatherDataList.getPressureWeatherDataValue} millibars');
        print('getPressureWeatherDataValue ${weatherDataList.getPressureWeatherDataValue}');
      });
      resetResultsScreenCount++;
      resetWidgetCount = 0;
    }
    print('at the exit of the getLocationWeather: resetWidgetCount = $resetWidgetCount and resetResultsScreenCount = $resetResultsScreenCount');
  } //getLocationWeather

  @override
  void initState() {
    // getLocationWeather();
    resetResultsScreenCount = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final inputLocationAndSelectionValues = ModalRoute.of(context)?.settings.arguments as LocationArguments;
    final lat = inputLocationAndSelectionValues.latitudeLocation;
    final lon = inputLocationAndSelectionValues.longitudeLocation;
    final tempSelectionValue = inputLocationAndSelectionValues.tempSelectionValue;
    final speedSelectionValue = inputLocationAndSelectionValues.speedSelectionValue;
    int resetWidgetCount = inputLocationAndSelectionValues.resetWidgetCount;
    print('This is the LocationArguments data passed from input screen lat: $lat');
    print('This is the LocationArguments data passed from input screen lon: $lon');
    getLocationWeather(lat, lon, resetWidgetCount, tempSelectionValue, speedSelectionValue);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(kLightestBlue),
        title: const FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            'Real-Time Wind Report',
            style: TextStyle(
              fontFamily: kFontTypeForApp,
              color: Color(kDarkFontColor),
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
        child: ListView.separated(
          itemCount: weatherResultsList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: EdgeInsets.all(8.0),
                decoration: kStyleBoxDecoration,
                height: kContainerHeight,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    weatherResultsList[index].toString(),
                    style: const TextStyle(color: Color(kFontColor), fontFamily: kFontTypeForApp, fontSize: kContainerFontHeight, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return Divider(color: Colors.black);
          },
        ),
      ),
    );
  } //Widget
} //class
/*
  body: ListView.separated(
        padding: const EdgeInsets.all(8),
        itemCount: rcDutySchedule.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            decoration: styleBoxDecoration,
            height: kContainerHeight,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  rcDutySchedule[index],
                  style: const TextStyle(color: Color(kFontColor), fontFamily: kFontTypeForApp, fontSize: kContainerFontHeight, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(
          height: 25.0,
        ),
      ),
 */
