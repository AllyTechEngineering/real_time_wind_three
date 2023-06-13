import 'package:flutter/material.dart';
import 'package:real_time_wind_three/models/latitude_model.dart';
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

  late dynamic lat = 'default';
  late dynamic lon = 'default';
  static List<dynamic> weatherResultsList = [];

  Future<dynamic> getLocationWeather() async {
    // if (latitudeDataValue.getLatitudeValue == 0) {
    lat = '39.5668';
    // } else {
    //   lat = latitudeDataValue.getLatitudeValue;
    // }
    // if (longitudeDataValue.getLongitudeValue == 0) {
    lon = '-84.7446';
    // } else {
    //   lon = longitudeDataValue.getLongitudeValue;
    // }

    /// Get location data
    ///&units=metric change the temperature metric
    NetworkData networkHelper = NetworkData('$weatherApiUrl?lat=$lat&lon=$lon&appid=$apiKey&units=imperial');
    var tempApiValue = ('$weatherApiUrl?lat=$lat&lon=$lon&appid=$apiKey&units=imperial');
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
      weatherResultsList.add('Latitude: ${weatherDataList.getLatitudeWeatherDataValue}');
      print('getLatitudeWeatherDataValue ${weatherDataList.getLatitudeWeatherDataValue}');
      weatherResultsList.add('Longitude: ${weatherDataList.getLongitudeWeatherDataValue}');
      print('getLongitudeWeatherDataValue ${weatherDataList.getLongitudeWeatherDataValue}');
      weatherResultsList.add('City: ${weatherDataList.getCityWeatherDataValue}');
      print('getCityWeatherDataValue ${weatherDataList.getCityWeatherDataValue}');
      weatherResultsList.add('Country: ${weatherDataList.getCountryWeatherDataValue}');
      print('getCountryWeatherDataValue ${weatherDataList.getCountryWeatherDataValue}');
      weatherResultsList.add('Wind Speed: ${weatherDataList.getWindSpeedWeatherDataValue}');
      print('getWindSpeedWeatherDataValue ${weatherDataList.getWindSpeedWeatherDataValue}');
      weatherResultsList.add('Wind Gust: ${weatherDataList.getWindGustWeatherDataValue}');
      print('getWindGustWeatherDataValue ${weatherDataList.getWindGustWeatherDataValue}');
      weatherResultsList.add('Wind Direction: ${weatherDataList.getWindDirectionWeatherDataValue}');
      print('getWindDirectionWeatherDataValue ${weatherDataList.getWindDirectionWeatherDataValue}');
      weatherResultsList.add('Temperature: ${weatherDataList.getTemperatureWeatherDataValue}');
      print('getTemperatureWeatherDataValue ${weatherDataList.getTemperatureWeatherDataValue}');
      weatherResultsList.add('Pressure: ${weatherDataList.getPressureWeatherDataValue}');
      print('getPressureWeatherDataValue ${weatherDataList.getPressureWeatherDataValue}');
    });
  } //getLocationWeather

  @override
  void initState() {
    getLocationWeather();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // List<dynamic> weatherResultsList = [];
    return Scaffold(
      appBar: AppBar(
        title: Text('Real Time Wind Report'),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(8.0, 20.0, 8.0, 10.0),
        child: ListView.separated(
          itemCount: weatherResultsList.length,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(width: 1, color: Colors.black),
                ),
              ),
              child: Text(
                weatherResultsList[index].toString(),
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
