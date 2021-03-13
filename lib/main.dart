import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Screens/drawerScreen.dart';
import 'Screens/events.dart';
import 'Screens/home.dart';
import 'package:google_fonts/google_fonts.dart';


void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarBrightness: Brightness.light,
      statusBarColor: Colors.white
  ));


  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ' Que\'s Todo',
      debugShowCheckedModeBanner: false,
      theme:ThemeData(
        textTheme: GoogleFonts.nunitoTextTheme(
          Theme.of(context).textTheme
        )
      ) ,

      home: base()
      );
  }
}


class base extends StatefulWidget {
  @override
  _baseState createState() => _baseState();
}

class _baseState extends State<base> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
   backgroundColor:  Colors.deepPurple,
      body: Stack(
        children: [
          drawerScreen(),
          events(),
          home(),

        ],
      ),
    );
  }
}


