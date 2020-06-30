import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  String url;
  String time;
  String flag;
  bool isDay;

  WorldTime({this.location, this.url, this.flag});

  Future<void> getTime() async {
    try {
      Response response = await get('http://worldtimeapi.org/api/timezone/$url');
      // Convert Json String
      Map reply = jsonDecode(response.body);

      // Get data from api call
      String datetime = reply['datetime'];
      String offset = reply['utc_offset'].substring(1,3);

      // Create datetime object
      DateTime now = DateTime.parse(datetime);

      // Add offset to the time returned
      now = now.add(Duration(hours: int.parse(offset)));

      // Determine day or night
      isDay = now.hour > 6 && now.hour < 19 ? true : false;

      // Set the time variable
      time = DateFormat.jm().format(now);
    } catch(e) {
      print("Caught Error: $e");
      time = 'Could not get time for this location';
    }
  }
}
