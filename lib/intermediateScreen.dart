import 'package:coders_castle/check_internet_connectivity/connectivity_provider.dart';
import 'package:coders_castle/check_internet_connectivity/no_internet.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/homePage.dart';

class InterMediateScreen extends StatefulWidget {
  @override
  _InterMediateScreenState createState() => _InterMediateScreenState();
}

class _InterMediateScreenState extends State<InterMediateScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<ConnectivityProvider>(context, listen: false).startMonitoring();
  }

  @override
  Widget build(BuildContext context) {
    return pageUI();
  }

  Widget pageUI() {
    return Consumer<ConnectivityProvider>(
      builder: (consumerContext, model, child) {
        if (model.isOnline != null) {
          return model.isOnline ? HomePage() : NoInternet();
        }
        return Container(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
