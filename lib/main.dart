// ignore_for_file: prefer_const_constructors
import 'dart:async';
import 'package:coders_castle/screens/homePage.dart';
import 'intermediateScreen.dart';
import 'package:flutter/material.dart';
import 'package:coders_castle/screens/homeScreen.dart';
import 'package:coders_castle/screens/profileScreen/profileScreen.dart';
import 'package:coders_castle/screens/contestScreen/contestScreen.dart';
import 'package:coders_castle/screens/statsScreen/statsScreen.dart';
import 'package:provider/provider.dart';
import 'package:coders_castle/check_internet_connectivity/connectivity_provider.dart';

import 'check_internet_connectivity/no_internet.dart';
import 'modals/contests_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    get();
    super.initState();
  }

  Future<void> get() async {
    await Codeforces().getContestInfo();
    await AtCoder().getContestInfo();
    await KickStart().getContestInfo();
    await LeetCode().getContestInfo();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ConnectivityProvider(),
          child: InterMediateScreen(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        home: InterMediateScreen(),
      ),
    );
  }
}
