import 'package:flutter/material.dart';
import 'package:real_time_wind_three/screens/data_input_screen.dart';
import 'package:real_time_wind_three/screens/results_screen.dart';
import 'package:real_time_wind_three/screens/settings_screen.dart';

void main() {
  runApp(const BoatingRealTimeWind());
}

class BoatingRealTimeWind extends StatelessWidget {
  const BoatingRealTimeWind({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Boating Real Time Wind Report',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      initialRoute: DataInputScreen.id,
      routes: {
        DataInputScreen.id: (context) => const DataInputScreen(),
        ResultsScreen.id: (context) => const ResultsScreen(),
        SettingsScreen.id: (context) => const SettingsScreen(),
      },
    );
  }
}
