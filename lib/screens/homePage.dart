import 'package:coders_castle/check_internet_connectivity/connectivity_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'homeScreen.dart';
class HomePage extends StatelessWidget {
  static const String id = 'Homepage';
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ConnectivityProvider(),
          child: HomeScreen(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        home: HomeScreen(),
      ),
    );
  }
}
