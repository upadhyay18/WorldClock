import 'package:flutter/material.dart';
import 'package:worldclock/service/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(
        location: 'New York (USA)', flag: 'usa.jpeg', url: 'America/New_York'),
    WorldTime(
        location: 'Kolkata (India)', flag: 'india.jpeg', url: 'Asia/Kolkata'),
    WorldTime(
        location: 'Tokeyo (Japan)', flag: 'japan.jpeg', url: 'Asia/Tokyo'),
    WorldTime(location: 'London (UK)', flag: 'uk.jpeg', url: 'Europe/London'),
    WorldTime(location: 'Singapore', flag: 'sing.jpeg', url: 'Asia/Singapore'),
    WorldTime(
        location: 'Istanbul', flag: 'instan.jpeg', url: 'Europe/Istanbul'),
    WorldTime(location: 'Maldives', flag: 'mald.jpeg', url: 'Indian/Maldives'),
    WorldTime(location: 'Budapest', flag: 'buda.jpeg', url: 'Europe/Budapest'),
    WorldTime(
        location: 'Melbourne (Aus)',
        flag: 'aus.jpeg',
        url: 'Australia/Melbourne'),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    //navigate to home screen

    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'isdayTime': instance.isdayTime,
      'time': instance.time,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.indigo[100],
        appBar: AppBar(
          backgroundColor: Colors.lightBlue[900],
          title: Text('Choose a Loaction'),
          centerTitle: true,
          elevation: 0,
        ),
        body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
              child: Card(
                child: ListTile(
                  onTap: () {
                    updateTime(index);
                  },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/${locations[index].flag}'),
                  ),
                ),
              ),
            );
          },
        ));
  }
}
