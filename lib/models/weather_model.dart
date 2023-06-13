import 'package:real_time_wind_three/models/latitude_model.dart';
import 'package:real_time_wind_three/models/longitude_model.dart';

import '../services/network_services.dart';
import '../services/constants.dart';

const weatherApiUrl = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  LatitudeDataValue latitudeDataValue = LatitudeDataValue();
  LongitudeDataValue longitudeDataValue = LongitudeDataValue();
  static String lat = 'default';
  static String lon = 'default';
  static int tempChoice = 0;
  static int speedChoice = 0;

  Future<dynamic> getLocationWeather() async {
    /// await for methods that return future
    // Location location = Location();
    // await location.getCurrentLocation();
    lat = latitudeDataValue.getLatitudeValue;
    lon = longitudeDataValue.getLongitudeValue;

    /// Get location data
    ///&units=metric change the temperature metric
    NetworkData networkHelper =
        NetworkData('$weatherApiUrl?lat=${longitudeDataValue.getLongitudeValue}&lon=${longitudeDataValue.getLongitudeValue}&appid=$apiKey&units=imperial');
    var tempApiValue = ('$weatherApiUrl?lat=${longitudeDataValue.getLongitudeValue}&lon=${longitudeDataValue.getLongitudeValue}&appid=$apiKey&units=imperial');
    print('This is the API call: $tempApiValue');
    var weatherData = await networkHelper.getData();
    print('This is the weatherData in the WeatherModel Class: $weatherData');
    return weatherData;
  } //getLocationWeather
} //class
