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
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
  bool showSpinner = false;
  @override
  void initState() {
    super.initState();
    setState(() {
      showSpinner = true;
    });
    get();
    // Timer(Duration(milliseconds: 500), () {
    //   Navigator.pushNamed(context, HomeScreen.id);
    // });
  }

  Future<void> get() async {
    // await CodeChef().getContestInfo();
    // await Codeforces().getContestInfo();
    // await AtCoder().getContestInfo();
    // await KickStart().getContestInfo();
    // await LeetCode().getContestInfo();
    await All().getContestInfo();
    Navigator.pushReplacementNamed(context, HomeScreen.id);
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
                SizedBox(
                    height: 150,
                    width: 150,
                    child: SvgPicture.asset("images/logo.svg")),
                SizedBox(height: 50.0),
                Text(
                  'CODERS CASTLE',
                  style: TextStyle(
                    fontSize: 40,
                    fontFamily: 'Fredoka',
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 50.0),
                showSpinner
                    ? LinearProgressIndicator(
                        backgroundColor: Colors.white,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),
                      )
                    : null,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
