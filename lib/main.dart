import 'package:flutter/material.dart';
//import 'pages/home.dart';
import 'package:worldclock/pages/home.dart';
import 'package:worldclock/pages/loading.dart';
import 'package:worldclock/pages/choose_location.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Loading(),
        '/home': (context) => Home(),
        '/location': (context) => ChooseLocation(),
      },
    ));
