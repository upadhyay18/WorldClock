import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:worldclock/service/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = 'loading...';
  void setupWorldTime() async {
    WorldTime instance =
        WorldTime(location: 'India', flag: 'india.jpeg', url: 'Asia/Kolkata');
    await instance.getTime();
    //print(instance.time);
    // setState(() {
    //   time = instance.time;
    // });
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isdayTime': instance.isdayTime,
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[900],
      body: Center(
        child: SpinKitCubeGrid(
          color: Colors.white,
          size: 70.0,
        ),
      ),
    );
  }
}
