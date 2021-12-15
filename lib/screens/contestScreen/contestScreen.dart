// ignore_for_file: file_names, prefer_const_constructors
import 'package:coders_castle/widgets/resuable.dart';
import 'package:flutter/material.dart';

class ContestScreen extends StatefulWidget {
  const ContestScreen({Key key}) : super(key: key);
  static const String id = 'ContestScreen';
  @override
  _ContestScreenState createState() => _ContestScreenState();
}

class _ContestScreenState extends State<ContestScreen> {
  @override
  Widget build(BuildContext context) {
    return GlassBackground(
      childWidget: Center(
        child: Text(
          'Contests',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
