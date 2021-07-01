import 'dart:ffi';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    data = data.isEmpty
        ? (ModalRoute.of(context)!.settings.arguments as Map)
        : (data);
    //print(data);
    String bgImage = data['isdayTime'] ? ('day.jpeg') : ('night.jpeg');
    Color? bgColor = data['isdayTime'] ? Colors.blue[50] : Colors.indigo[900];
    Color? textColor = data['isdayTime'] ? Colors.black54 : Colors.white70;
    return Scaffold(
        backgroundColor: bgColor,
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover,
            )),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 70, 0, 90),
              child: Column(
                children: <Widget>[
                  TextButton(
                      onPressed: () async {
                        dynamic result =
                            await Navigator.pushNamed(context, '/location');
                        //we store returing map data to "data" map
                        setState(() {
                          data = {
                            'time': result['time'],
                            'location': result['location'],
                            'isdayTime': result['isdayTime'],
                            'flag': result['flag'],
                          };
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Icon(
                            Icons.edit_location,
                            color: textColor,
                          ),
                          Text('Edit Loaction',
                              style: TextStyle(
                                fontSize: 20,
                                color: textColor,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.5,
                              )),
                        ],
                      )),
                  SizedBox(
                    height: 60.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(data['location'],
                          style: TextStyle(
                            fontSize: 30,
                            color: textColor,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2.0,
                          )),
                      SizedBox(
                        width: 10.0,
                      ),
                      Image(
                        image: AssetImage('assets/' + data['flag']),
                        height: 30.0,
                      ),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  Text(data['time'],
                      style: TextStyle(
                        fontSize: 60,
                        color: textColor,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2.0,
                      ))
                ],
              ),
            ),
          ),
        ));
  }
}
