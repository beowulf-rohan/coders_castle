import 'dart:async';

import 'package:coders_castle/check_internet_connectivity/connectivity_provider.dart';
import 'package:coders_castle/check_internet_connectivity/no_internet.dart';
import 'package:coders_castle/modals/contests_list.dart';
import 'package:coders_castle/screens/profileScreen/profileScreen.dart';
import 'package:coders_castle/screens/statsScreen/statsScreen.dart';
import 'package:coders_castle/widgets/resuable.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'contestScreen/contestScreen.dart';
import 'homeScreen.dart';

class HomePage extends StatelessWidget {
  static const String id = 'Homepage';
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
        HomePage.id: (context) => HomePage(),
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
    if (LeetCode.flinks.isEmpty &&
        Codeforces.fat.isEmpty &&
        AtCoder.fat.isEmpty &&
        LeetCode.flinks.isEmpty) get();
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, HomeScreen.id);
    });
    // Timer(Duration(milliseconds: 500), () {
    //   Navigator.pushNamed(context, HomeScreen.id);
    // });
    Future.delayed(const Duration(milliseconds: 1000), () {
      setState(() {
        widget1Opacity = 1;
      });
    });
    super.initState();
  }

  Future<void> get() async {
    await CodeChef().getContestInfo();
    await Codeforces().getContestInfo();
    await AtCoder().getContestInfo();
    await KickStart().getContestInfo();
    await LeetCode().getContestInfo();
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
