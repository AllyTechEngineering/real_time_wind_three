import 'package:real_time_wind_three/models/weather_data_list.dart';

class WeatherDataListResults {
  WeatherDataList weatherDataList = WeatherDataList();
  List<dynamic> makeWeatherDataResultsList (){
    List<dynamic> weatherResultsList = [];
    weatherResultsList.add(weatherDataList.getLatitudeWeatherDataValue);
    print('getLatitudeWeatherDataValue ${weatherDataList.getLatitudeWeatherDataValue}');
    weatherResultsList.add(weatherDataList.getLongitudeWeatherDataValue);
    print('getLongitudeWeatherDataValue ${weatherDataList.getLongitudeWeatherDataValue}');
    weatherResultsList.add(weatherDataList.getCityWeatherDataValue);
    print('getCityWeatherDataValue ${weatherDataList.getCityWeatherDataValue}');
    weatherResultsList.add(weatherDataList.getCountryWeatherDataValue);
    print('getCountryWeatherDataValue ${weatherDataList.getCountryWeatherDataValue}');
    weatherResultsList.add(weatherDataList.getWindSpeedWeatherDataValue);
    print('getWindSpeedWeatherDataValue ${weatherDataList.getWindSpeedWeatherDataValue}');
    weatherResultsList.add(weatherDataList.getWindGustWeatherDataValue);
    print('getWindGustWeatherDataValue ${weatherDataList.getWindGustWeatherDataValue}');
    weatherResultsList.add(weatherDataList.getWindDirectionWeatherDataValue);
    print('getWindDirectionWeatherDataValue ${weatherDataList.getWindDirectionWeatherDataValue}');
    weatherResultsList.add(weatherDataList.getTemperatureWeatherDataValue);
    print('getTemperatureWeatherDataValue ${weatherDataList.getTemperatureWeatherDataValue}');
    weatherResultsList.add(weatherDataList.getPressureWeatherDataValue);
    print('getPressureWeatherDataValue ${weatherDataList.getPressureWeatherDataValue}');
    return weatherResultsList;
  }

} //

/*
      List<dynamic> weatherResultsList = [];
      weatherResultsList.add(weatherDataList.getLatitudeWeatherDataValue);
      print('getLatitudeWeatherDataValue ${weatherDataList.getLatitudeWeatherDataValue}');
      weatherResultsList.add(weatherDataList.getLongitudeWeatherDataValue);
      print('getLongitudeWeatherDataValue ${weatherDataList.getLongitudeWeatherDataValue}');
      weatherResultsList.add(weatherDataList.getCityWeatherDataValue);
      print('getCityWeatherDataValue ${weatherDataList.getCityWeatherDataValue}');
      weatherResultsList.add(weatherDataList.getCountryWeatherDataValue);
      print('getCountryWeatherDataValue ${weatherDataList.getCountryWeatherDataValue}');
      weatherResultsList.add(weatherDataList.getWindSpeedWeatherDataValue);
      print('getWindSpeedWeatherDataValue ${weatherDataList.getWindSpeedWeatherDataValue}');
      weatherResultsList.add(weatherDataList.getWindGustWeatherDataValue);
      print('getWindGustWeatherDataValue ${weatherDataList.getWindGustWeatherDataValue}');
      weatherResultsList.add(weatherDataList.getWindDirectionWeatherDataValue);
      print('getWindDirectionWeatherDataValue ${weatherDataList.getWindDirectionWeatherDataValue}');
      weatherResultsList.add(weatherDataList.getTemperatureWeatherDataValue);
      print('getTemperatureWeatherDataValue ${weatherDataList.getTemperatureWeatherDataValue}');
      weatherResultsList.add(weatherDataList.getPressureWeatherDataValue);
      print('getPressureWeatherDataValue ${weatherDataList.getPressureWeatherDataValue}');
 */