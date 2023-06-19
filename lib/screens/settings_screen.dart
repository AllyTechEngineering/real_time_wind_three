import 'package:flutter/material.dart';
import 'package:real_time_wind_three/models/network_url.dart';
import '../services/constants.dart';

class SettingsScreen extends StatefulWidget {
  static String id = 'settings_screen';
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  NetworkUrlClass networkUrlClass = NetworkUrlClass();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: const Color(kDarkestBlue),
        title: const FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            'App Development by Allytech',
            style: kTextStyleForAppBar,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/OceanBackgroundWithOutBackgroundImage.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView(
                    children: [
                      aboutUsMethod(),
                      moreInfoMethod(),
                      contactUsMethod(),
                      privacyMethod(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  } //Widget

  Padding privacyMethod() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        child: const SettingsScreenContainerDecoration(privacy),
        onTap: () {
          networkUrlClass.launchUrlMethod(kCompanyPrivacy);
        },
      ),
    );
  }

  Padding contactUsMethod() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        child: const SettingsScreenContainerDecoration(clickToContactUs),
        onTap: () {
          networkUrlClass.launchUrlMethod(kCompanyContactForm);
        },
      ),
    );
  }

  Padding moreInfoMethod() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        child: const SettingsScreenContainerDecoration(textClickForMoreInfo),
        onTap: () {
          networkUrlClass.launchUrlMethod(kCompanyWebsite);
        },
      ),
    );
  }

  Padding aboutUsMethod() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        child: const SettingsScreenContainerDecoration(textAboutUs),
        onTap: () {
          networkUrlClass.launchUrlMethod(kCompanyAboutUs);
        },
      ),
    );
  } //widget
} //class

class SettingsScreenContainerDecoration extends StatelessWidget {
  final String textValue;
  const SettingsScreenContainerDecoration(this.textValue, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kStyleBoxDecoration,
      height: kContainerHeight,
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            textValue,
            textAlign: TextAlign.left,
            style: kTextStyleSettings,
          ),
        ),
      ),
    );
  }
} //class
