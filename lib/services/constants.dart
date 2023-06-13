import 'package:flutter/material.dart';

const apiKey = 'cdc0b1434b7f3e27f4b1b498bd79fe2d';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';
const BoxDecoration styleBoxDecoration = (BoxDecoration(
  gradient: LinearGradient(
    colors: [Color(kDarkestBlue), Color(kMediumBlue)],
  ),
  boxShadow: [
    BoxShadow(
      color: Colors.black,
      offset: Offset(5.0, 5.0),
      blurRadius: 10.0,
      spreadRadius: 2.0,
    ),
  ],
  color: Color(kDarkestBlue),
  borderRadius: BorderRadius.only(
    topRight: Radius.circular(20.0),
    bottomRight: Radius.circular(0.0),
    topLeft: Radius.circular(0.0),
    bottomLeft: Radius.circular(20.0),
  ),
));
final ButtonStyle kStyleElevatedButton = ElevatedButton.styleFrom(
  side: const BorderSide(width: 2, color: Color(kLightestBlue), style: BorderStyle.solid),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(kButtonRadiusValue),
  ),
  backgroundColor: const Color(kDarkBlue),
  padding: const EdgeInsets.only(left: 6.0, right: 6.0, top: 0.0, bottom: 0.0),
  elevation: 25.0,
  shadowColor: const Color(kLightestBlue),
  textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontFamily: kFontTypeForApp, color: Color(kWhiteHexValue)),
);
const double kContainerHeight = 110.0;
const double kContainerFontHeight = 14.0;
const double kAppBarFontHeight = 20.0;
const String kFontTypeForApp = 'Roboto-Thin';
const double kFontHeightMedium = 14.0;
const double kFontHeightSmall = 12.0;
const double kFontHeightLarge = 20.0;
const int kFontColor = 0xFFFFFFFF;
const int kIconColor = 0xFFFF0000;
const double kSocialMediaIconHeight = 50.0;
const double kSocialMediaIconWidth = 135.0;
const double kSocialMediaFontHeight = 10.0;
const double kIconHeightValue = 60.0;
const double kButtonRadiusValue = 20.0;
const double kButtonRowSpacingTop = 1.0;
const double kButtonRowSpacingBottom = 20.0;
const double kWidthElevatedButton = 200.0;
const double kHeightElevatedButton = 65.0;
const double kWidthResultsElevatedButton = 200.0;
const double kHeightResultsElevatedButton = 75.0;
const double kLogoHeightValue = 200.0;
const double kLogoWidthValue = 300.0;
const int kDarkestBlue = 0xFF0B2447;
const int kDarkBlue = 0xFF19376D;
const int kMediumBlue = 0xFF576CBC;
const int kScaffoldColor = 0xFFA5D7E8;
const int kLightestBlue = 0xFFA5D7E8;
const int kWhiteHexValue = 0xFFFFFFFF;
const double kFontSizeValue = 16.0;
const String kCopyRightText = 'Allytech LLC: All Rights Reserved 2023';
const double kTextContainerHeight = 140.0;
const double kTextContainerWidth = 500.0;
const double kTextContainerFontHeight = 18.0;
const String kTitleText = 'Boat Real Time Wind Report';
