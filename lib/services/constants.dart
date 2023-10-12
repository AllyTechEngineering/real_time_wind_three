import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

const apiKey = 'cdc0b1434b7f3e27f4b1b498bd79fe2d';
// const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';
const weatherApiUrl = 'https://api.openweathermap.org/data/2.5/weather';
const BoxDecoration kStyleBoxDecoration = (BoxDecoration(
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
    topRight: Radius.circular(10.0),
    bottomRight: Radius.circular(0.0),
    topLeft: Radius.circular(0.0),
    bottomLeft: Radius.circular(10.0),
  ),
));
final ButtonStyle kStyleElevatedButtonOne = ElevatedButton.styleFrom(
  side: const BorderSide(
      width: 2, color: Color(kLightestBlue), style: BorderStyle.solid),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(kButtonRadiusValue),
  ),
  backgroundColor: const Color(kDarkBlue),
  padding: const EdgeInsets.only(left: 6.0, right: 6.0, top: 0.0, bottom: 0.0),
  elevation: 25.0,
  shadowColor: const Color(kDarkestBlue),
  textStyle: const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      fontFamily: kFontTypeForApp,
      color: Color(kWhiteHexValue)),
);
final ButtonStyle kStyleElevatedButtonTwo = ElevatedButton.styleFrom(
  // side: const BorderSide(width: 2, color: Color(kLightestBlue), style: BorderStyle.solid),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
      topRight: Radius.circular(10.0),
      bottomRight: Radius.circular(0.0),
      topLeft: Radius.circular(0.0),
      bottomLeft: Radius.circular(10.0),
    ),
  ),
  backgroundColor: const Color(kDarkBlue),
  padding: const EdgeInsets.only(left: 6.0, right: 6.0, top: 0.0, bottom: 0.0),
  elevation: 25.0,
  shadowColor: const Color(kDarkestBlue),
  textStyle: const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      fontFamily: kFontTypeForApp,
      color: Color(kWhiteHexValue)),
);
final TextStyle kTextStyle = TextStyle(fontSize: 16.sp);
const TextStyle kTextStyleForAppBar = TextStyle(
  fontFamily: kFontTypeForApp,
  color: Color(kFontColor),
  fontSize: kFontSizeValue,
  fontWeight: FontWeight.bold,
  overflow: TextOverflow.ellipsis,
);
EdgeInsets kEdgeInsetContainerValue8_2_8_2 =
    const EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 2.0);
EdgeInsets kEdgeInsetValue8480 = const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 0.0);
EdgeInsets kEdgeInsetValue8484 = const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0);
const TextStyle kTextStyleExplainText = TextStyle(
    fontFamily: kFontTypeForApp,
    fontWeight: FontWeight.bold,
    fontSize: 16,
    color: Color(kDarkestBlue));
const TextStyle kTextStyleDataSettingsText = TextStyle(
    fontFamily: kFontTypeForApp,
    fontWeight: FontWeight.w500,
    fontSize: 14,
    color: Color(kDarkestBlue));
const TextStyle kTextStyleSettings = TextStyle(
    color: Color(kFontColor),
    fontFamily: kFontTypeForApp,
    fontSize: kFontSizeValue,
    fontWeight: FontWeight.bold);
const TextStyle kTextStyleFieldDataInput = TextStyle(
    color: Colors.white,
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
    fontStyle: FontStyle.normal);
const double kContainerHeight = 75.0;
const double kContainerFontHeight = 16.0;
const double kAppBarFontHeight = 20.0;
const String kFontTypeForApp = 'Roboto-Thin';
const double kFontHeightMedium = 10.0;
const double kFontHeightSmall = 8.0;
const double kFontHeightLarge = 12.0;
const int kFontColor = 0xFFFFFFFF;
const int kDarkFontColor = kDarkestBlue;
const int kIconColor = 0xFFFF0000;
const double kSocialMediaIconHeight = 50.0;
const double kSocialMediaIconWidth = 135.0;
const double kSocialMediaFontHeight = 10.0;
const double kIconHeightValue = 60.0;
const double kButtonRadiusValue = 10.0;
const double kButtonRowSpacingTop = 1.0;
const double kButtonRowSpacingBottom = 20.0;
const double kWidthElevatedButton = 300.0;
const double kHeightElevatedButton = 50.0;
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
const double kSettingsTextContainerHeight = 200.0;
const double kTextContainerWidth = 500.0;
const double kTextContainerFontHeight = 18.0;
const String kTitleText = 'Real Time Wind Report';
const String aboutUs =
    'What we do: exceptional custom Flutter/Dart cross platform app development.';
const String companyName = 'Company name: Allytech LLC';
const String emailContact = 'Email: btaylor@allytechllc.com';
const String kCompanyWebsite = 'https://allytechllc.com/';
const String kCompanyContactForm = 'https://allytechllc.com/contact-us/';
const String kCompanyAboutUs = 'https://allytechllc.com/about-us';
const String kCompanyPrivacy = 'https://allytechllc.com/privacy';
const String textAboutUs = 'About Us';
const String textClickForMoreInfo = 'Click for More Information!';
const String clickToContactUs = 'Click to Contact Us!';
const String privacy = 'Allytech LLC 2023 \u00A9';
const List<String> kLakeNameDetailList = [
  'Acton Lake OH',
  '625 Acres, No Wake',
  '39.5723',
  '-84.7480',
  'Cowan Lake OH',
  '1,075 Acres, 10HP Limit',
  '39.3864',
  '-83.9035',
  'St. Marys Lake OH',
  '13,500 Acres, NO HP or Speed Limit*',
  '40.5252',
  '-84.5010'
];
