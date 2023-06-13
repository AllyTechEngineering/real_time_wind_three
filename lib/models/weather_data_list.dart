class WeatherDataList {
  late dynamic latitudeWeatherDataValue = '39.5668';
  late dynamic longitudeWeatherDataValue = '-84.7446';
  late dynamic cityWeatherDataValue = 'Any Town';
  late dynamic countryWeatherDataValue = 'Any Country';
  late dynamic windSpeedWeatherDataValue = 0;
  late dynamic windGustWeatherDataValue = 0;
  late dynamic windDirectionWeatherDataValue = 0;
  late dynamic temperatureWeatherDataValue = 0;
  late dynamic pressureWeatherDataValue = 0;

  /// Latitude
  dynamic get getLatitudeWeatherDataValue {
    // print('This is getLatitudeWeatherDataValue: $latitudeWeatherDataValue');
    return latitudeWeatherDataValue;
  } //get

  set setLatitudeWeatherDataValue(dynamic latitudeValue) {
    // print('This is latitudeWeatherDataValue: $latitudeWeatherDataValue');
    latitudeWeatherDataValue = latitudeValue;
  } //set

  /// Longitude
  dynamic get getLongitudeWeatherDataValue {
    // print('This is getLongitudeWeatherDataValue $longitudeWeatherDataValue');
    return longitudeWeatherDataValue;
  } //get

  set setLongitudeWeatherDataValue(dynamic longitudeValue) {
    // print('This is setLongitudeWeatherDataValue: $longitudeWeatherDataValue');
    longitudeWeatherDataValue = longitudeValue;
  } //set

  /// City
  dynamic get getCityWeatherDataValue {
    // print('This is getLongitudeWeatherDataValue $cityWeatherDataValue');
    return cityWeatherDataValue;
  } //get

  set setCityWeatherDataValue(dynamic cityValue) {
    // print('This is setLongitudeWeatherDataValue: $cityWeatherDataValue');
    cityWeatherDataValue = cityValue;
  } //set

  /// Country
  dynamic get getCountryWeatherDataValue {
    // print('This is getCountryWeatherDataValue $countryWeatherDataValue');
    return countryWeatherDataValue;
  } //get

  set setCountryWeatherDataValue(dynamic countryValue) {
    // print('This is setCountryWeatherDataValue: $countryWeatherDataValue');
    countryWeatherDataValue = countryValue;
  } //set

  /// Wind Speed
  dynamic get getWindSpeedWeatherDataValue {
    // print('This is getWindSpeedWeatherDataValue $windSpeedWeatherDataValue');
    return windSpeedWeatherDataValue;
  } //get

  set setWindSpeedWeatherDataValue(dynamic windSpeedValue) {
    // print('This is setWindSpeedWeatherDataValue: $windSpeedWeatherDataValue');
    windSpeedWeatherDataValue = windSpeedValue;
  } //set

  /// Wind Gusts
  dynamic get getWindGustWeatherDataValue {
    // print('This is getWindGustWeatherDataValue $windGustWeatherDataValue');
    return windGustWeatherDataValue;
  } //get

  set setWindGustWeatherDataValue(dynamic windGustValue) {
    // print('This is setWindGustWeatherDataValue: $windGustWeatherDataValue');
    windGustWeatherDataValue = windGustValue;
  } //set

  /// Wind Direction
  dynamic get getWindDirectionWeatherDataValue {
    // print('This is getWindDirectionWeatherDataValue $windDirectionWeatherDataValue');
    return windDirectionWeatherDataValue;
  } //get

  set setWindDirectionWeatherDataValue(dynamic windDirectionValue) {
    // print('This is setWindDirectionWeatherDataValue: $windDirectionWeatherDataValue');
    windDirectionWeatherDataValue = windDirectionValue;
  } //set

  /// Temperature
  dynamic get getTemperatureWeatherDataValue {
    // print('This is getTemperatureWeatherDataValue $temperatureWeatherDataValue');
    return temperatureWeatherDataValue;
  } //get

  set setTemperatureWeatherDataValue(dynamic TemperatureValue) {
    // print('This is setTemperatureWeatherDataValue: $temperatureWeatherDataValue');
    temperatureWeatherDataValue = TemperatureValue;
  } //set

  /// Pressure
  dynamic get getPressureWeatherDataValue {
    // print('This is getWindDirectionWeatherDataValue $pressureWeatherDataValue');
    return pressureWeatherDataValue;
  } //get

  set setPressureWeatherDataValue(dynamic pressureValue) {
    // print('This is setWindDirectionWeatherDataValue: $pressureWeatherDataValue');
    pressureWeatherDataValue = pressureValue;
  } //set
} //class
