// ignore_for_file: file_names, prefer_const_constructors
import 'package:coders_castle/widgets/resuable.dart';
import 'package:flutter/material.dart';

class StatsScreen extends StatefulWidget {
  const StatsScreen({Key key}) : super(key: key);
  static const String id = 'StatsScreen';
  @override
  _StatsScreenState createState() => _StatsScreenState();
}

class _StatsScreenState extends State<StatsScreen> {
  @override
  Widget build(BuildContext context) {
    return GlassBackground(
      childWidget: Center(
        child: Text(
          'Stats',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
