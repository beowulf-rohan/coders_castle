// ignore_for_file: file_names, prefer_const_constructors
import 'package:coders_castle/widgets/resuable.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key key}) : super(key: key);
  static const String id = 'ProfileScreen';
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return GlassBackground(
      childWidget: Center(
        child: Text(
          'Profile',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
