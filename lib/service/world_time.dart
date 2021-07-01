import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location = ""; //location name
  String time = ""; //Time in That Location
  String flag = ""; //url to an asset flag icon
  String url = ""; //loaction url for api end point
  bool isdayTime = true;
  WorldTime({required this.location, required this.flag, required this.url});
  Future<void> getTime() async {
    try {
      //make the request
      Response response =
          await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);
      //get property from data
      String dateTime = data['utc_datetime'];
      String offSetHour = data['utc_offset'].substring(1, 3);
      String offSetMin = data['utc_offset'].substring(4, 6);
      //print(dateTime + " \t" + offSetHour + " " + offSetMin);

      //create DateTime object
      DateTime now = DateTime.parse(dateTime);
      now = now.add(Duration(
          hours: int.parse(offSetHour), minutes: int.parse(offSetMin)));
      isdayTime = ((now.hour > 6) && (now.hour < 20)) ? (true) : (false);
      time = DateFormat.jm().format(now);
    } catch (e) {
      print('Cought Error $e');
      time = 'could not get the time data';
    }
  }
}
