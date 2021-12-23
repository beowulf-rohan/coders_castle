// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:coders_castle/modals/contests_list.dart';
import 'package:coders_castle/screens/profileScreen/profileScreen.dart';
import 'package:coders_castle/screens/statsScreen/statsScreen.dart';
import 'package:coders_castle/widgets/resuable.dart';
import 'package:flutter/material.dart';
import 'package:coders_castle/modals/stats_list.dart' as stats;
import 'contestScreen/contestScreen.dart';
import 'homeScreen.dart';

class HomePage extends StatelessWidget {
  static const String id = 'Homepage';

  HomePage({Key key}) : super(key: key);
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
    super.initState();
    if (LeetCode.flinks.isEmpty &&
        Codeforces.fat.isEmpty &&
        AtCoder.fat.isEmpty &&
        LeetCode.flinks.isEmpty) get();
    Timer(Duration(seconds: 15), () {
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
  }

  Future<void> get() async {
    await CodeChef().getContestInfo();
    await Codeforces().getContestInfo();
    await AtCoder().getContestInfo();
    await KickStart().getContestInfo();
    await LeetCode().getContestInfo();

    final SharedPreferences sharedPref = await SharedPreferences.getInstance();
    String codechefUsername = sharedPref.getString('codechef');
    if (codechefUsername != null) {
      await stats.CodeChefPerformance().getPerformanceInfo(codechefUsername);
    }

    String codeforcesUsername = sharedPref.getString('codeforces');
    if (codeforcesUsername != null) {
      await stats.CodeforcesPerformance()
          .getPerformanceInfo(codeforcesUsername);
    }

    String leetcodeUsername = sharedPref.getString('leetcode');
    if (leetcodeUsername != null) {
      await stats.LeetCodePerformance().getPerformanceInfo(leetcodeUsername);
    }

    String atcoderUsername = sharedPref.getString('atcoder');
    if (atcoderUsername != null) {
      await stats.AtcoderPerformance().getPerformanceInfo(atcoderUsername);
    }
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
