// ignore_for_file: prefer_const_constructors

import 'intermediateScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:coders_castle/check_internet_connectivity/connectivity_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
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
