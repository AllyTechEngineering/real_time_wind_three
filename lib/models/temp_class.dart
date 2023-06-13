class TemperatureSelection {
  late int temperatureChoice = 0; //F is the default
  int get getTempChoice {
    return temperatureChoice;
  } //get

  set setTempChoice(int value) {
    temperatureChoice = value;
  } //set
} //class
