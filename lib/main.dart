// ignore_for_file: prefer_const_constructors
import 'dart:async';
import 'package:coders_castle/screens/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

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
    Future.delayed(Duration(milliseconds: 1000), () {
      setState(() {
        widget1Opacity = 1;
      });
    });
    Timer(Duration(seconds: 5), () {
      Navigator.pushNamed(context, HomeScreen.id);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: GlassmorphicContainer(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          border: 1.0,
          borderRadius: 15,
          blur: 10,
          linearGradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.white.withOpacity(0.25),
              Colors.white.withOpacity(0.05),
            ],
          ),
          borderGradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.white.withOpacity(0.2),
              Colors.white.withOpacity(0.2)
            ],
          ),
          child: Center(
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
