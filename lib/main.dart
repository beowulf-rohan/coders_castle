// ignore_for_file: prefer_const_constructors
import 'dart:async';
import 'package:coders_castle/widgets/resuable.dart';
import 'package:flutter/material.dart';
import 'package:coders_castle/screens/homeScreen.dart';
import 'package:coders_castle/screens/profileScreen/profileScreen.dart';
import 'package:coders_castle/screens/contestScreen/contestScreen.dart';
import 'package:coders_castle/screens/statsScreen/statsScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
      routes: {
        HomeScreen.id: (context) => HomeScreen(),
        ProfileScreen.id: (context) => ProfileScreen(),
        ContestScreen.id: (context) => ContestScreen(),
        StatsScreen.id: (context) => StatsScreen(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double widget1Opacity = 0.0;
  @override
  void initState() {
    // Timer(Duration(seconds: 5), () {
    //   Navigator.pushReplacementNamed(context, HomeScreen.id);
    // });
    Timer(Duration(milliseconds: 500), () {
      Navigator.pushNamed(context, HomeScreen.id);
    });
    Future.delayed(const Duration(milliseconds: 1000), () {
      setState(() {
        widget1Opacity = 1;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: GlassBackground(
          childWidget: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedOpacity(
                  opacity: widget1Opacity,
                  duration: Duration(milliseconds: 2500),
                  child: SizedBox(
                    height: 150,
                    width: 150,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
                SizedBox(height: 50.0),
                Text(
                  'CODERS CASTLE',
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
