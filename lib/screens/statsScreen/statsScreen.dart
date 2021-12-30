// ignore_for_file: file_names, prefer_const_constructors
import 'package:coders_castle/widgets/resuable.dart';
import 'package:flutter/material.dart';
import 'package:coders_castle/modals/platformStatsCard.dart';

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
      childWidget: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            Codechef.StatsCard(),
            Codeforces.StatsCard(),
            LeetCode.StatsCard(),
            AtCoder.StatsCard(),
            SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
