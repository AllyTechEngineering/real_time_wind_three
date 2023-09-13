import 'package:url_launcher/url_launcher.dart';

class NetworkUrlClass {
  launchUrlMethod(String urlValue) async {
    var url = Uri.parse(urlValue);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    } //else
  }
} //class
