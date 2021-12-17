// ignore_for_file: prefer_const_literals_to_create_immutables, file_names, prefer_const_constructors
import 'package:coders_castle/screens/contestScreen/reusable.dart';
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
      childWidget: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.only(top: 30),
              // height: 400,
              decoration: BoxDecoration(
                color: Color(0xff2a2a2a).withOpacity(0.2),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HeadingText(text: "Today"),
                  ContestCard(
                    path: 'images/leetcode.png',
                    contestName: 'Leetcode Weekly 272',
                    date: '16/12/21',
                    time: '8:00 PM',
                    duration: '1 hrs 30 min',
                  ),
                  ContestCard(
                    path: 'images/hackerearth.png',
                    contestName: 'Leetcode Weekly 272',
                    date: '16/12/21',
                    time: '8:00 PM',
                    duration: '1 hrs 30 min',
                  ),
                  ContestCard(
                    path: 'images/codechef.png',
                    contestName: 'Leetcode Weekly 272',
                    date: '16/12/21',
                    time: '8:00 PM',
                    duration: '1 hrs 30 min',
                  ),
                  SizedBox(height: 10)
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30),
              // height: 400,
              decoration: BoxDecoration(
                color: Color(0xff2a2a2a).withOpacity(0.2),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HeadingText(text: "Upcoming"),
                  ContestCard(
                    path: 'images/codeforces.png',
                    contestName: 'Leetcode Weekly 272',
                    date: '16/12/21',
                    time: '8:00 PM',
                    duration: '1 hrs 30 min',
                  ),
                  ContestCard(
                    path: 'images/spoj.png',
                    contestName: 'Leetcode Weekly 272',
                    date: '16/12/21',
                    time: '8:00 PM',
                    duration: '1 hrs 30 min',
                  ),
                  ContestCard(
                    path: 'images/hackerrank.png',
                    contestName: 'Leetcode Weekly 272',
                    date: '16/12/21',
                    time: '8:00 PM',
                    duration: '1 hrs 30 min',
                  ),
                  ContestCard(
                    path: 'images/atcoder.png',
                    contestName: 'Leetcode Weekly 272',
                    date: '16/12/21',
                    time: '8:00 PM',
                    duration: '1 hrs 30 min',
                  ),
                  ContestCard(
                    path: 'images/google.png',
                    contestName: 'Leetcode Weekly 272',
                    date: '16/12/21',
                    time: '8:00 PM',
                    duration: '1 hrs 30 min',
                  ),
                  SizedBox(height: 10)
                ],
              ),
            ),
            SizedBox(height: 30, width: double.infinity)
          ],
        ),
      ),
    );
  }
}
