class WindSpeedSelection {
  late int windSpeedChoice = 0; //MPH is default
  int get getWindSpeedChoice {
    print('This is inside of getWindSpeedChoice that returns windSpeedChoice: $windSpeedChoice');
    return windSpeedChoice;
  } //get

  set setWindSpeedChoice(int value) {
    print('This is inside of setWindSpeedChoice that sets windSpeedChoice: $windSpeedChoice');
    windSpeedChoice = value;
  } //set
} //class
