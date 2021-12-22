// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables, file_names, prefer_const_constructors

import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:coders_castle/modals/stats_list.dart' as stats;

class HeadingText1 extends StatelessWidget {
  const HeadingText1({Key key, @required this.text}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 20),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 28,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class Codechef {
  static String username = stats.CodeChefPerformance.username;
  static int maxRating = stats.CodeChefPerformance.maxRating;
  static int presentRating = stats.CodeChefPerformance.presentRating;
  static String designation = stats.CodeChefPerformance.designation;
  static List<dynamic> list = stats.CodeChefPerformance.ratings;
  static double maxX = 25;
  static List<FlSpot> flspots = [];

  static Widget StatsCard() {
    username = stats.CodeChefPerformance.username;
    maxRating = stats.CodeChefPerformance.maxRating;
    presentRating = stats.CodeChefPerformance.presentRating;
    designation = stats.CodeChefPerformance.designation;
    list = stats.CodeChefPerformance.ratings;
    maxX = (list.length / 10 + 1) * 10;

    if (flspots.isEmpty) {
      for (int j = 0; j < list.length; j++) {
        flspots.add(FlSpot((j + 1).toDouble(), list[j].toDouble()));
      }
    }

    return Container(
      margin: EdgeInsets.only(top: 30),
      decoration: BoxDecoration(
        color: Color(0xff2a2a2a).withOpacity(0.2),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeadingText1(text: "Codechef"),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.only(right: 25),
            child: AspectRatio(
              aspectRatio: 1.5,
              child: LineChart(
                LineChartData(
                  minX: 0,
                  maxX: maxX,
                  minY: 0,
                  maxY: 2500,
                  lineBarsData: [
                    LineChartBarData(
                      spots: flspots,
                      colors: [Colors.white],
                      dotData: FlDotData(
                        show: true,
                        getDotPainter: (spot, percent, barData, index) =>
                            FlDotCirclePainter(
                                radius: 1.5,
                                color: Colors.white.withOpacity(1)),
                      ),
                    ),
                  ],
                  gridData: FlGridData(show: false),
                  axisTitleData: FlAxisTitleData(
                    leftTitle: AxisTitle(
                      showTitle: true,
                      titleText: 'Rating->',
                      textStyle: TextStyle(color: Colors.white, fontSize: 10.0),
                    ),
                    bottomTitle: AxisTitle(
                        showTitle: true,
                        titleText: 'No of contest->',
                        textStyle:
                            TextStyle(color: Colors.white, fontSize: 10.0),
                        textAlign: TextAlign.center),
                  ),
                  titlesData: FlTitlesData(
                    rightTitles: SideTitles(
                      showTitles: false,
                    ),
                    topTitles: SideTitles(showTitles: false),
                    leftTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 30.0,
                      getTextStyles: (context, value) =>
                          const TextStyle(color: Colors.white, fontSize: 10.0),
                    ),
                    bottomTitles: SideTitles(
                      showTitles: true,
                      getTextStyles: (context, value) =>
                          const TextStyle(color: Colors.white, fontSize: 10.0),
                    ),
                  ),
                  borderData: FlBorderData(
                    show: true,
                    border: const Border(
                      left: BorderSide(color: Colors.white),
                      top: BorderSide(color: Colors.transparent),
                      bottom: BorderSide(color: Colors.white),
                      right: BorderSide(color: Colors.transparent),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 7.5, top: 3, bottom: 3),
                    child: SizedBox(
                      height: 70,
                      width: 50,
                      child: Image.asset('images/codechef.png'),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Divider(
                      indent: 5,
                      endIndent: 5,
                      color: Colors.white,
                      height: 15,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 10),
                        Text(
                          username,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 7.5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Max Rating : ',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                            Text(
                              maxRating.toString(),
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white.withOpacity(0.5)),
                            ),
                            SizedBox(width: 30),
                            Text(
                              'Current Rating : ',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                            Text(
                              presentRating.toString(),
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white.withOpacity(0.5)),
                            )
                          ],
                        ),
                        SizedBox(height: 7.5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              designation,
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10)
        ],
      ),
    );
  }
}

class Codeforces {
  static String username = stats.CodeforcesPerformance.username;
  static int maxRating = stats.CodeforcesPerformance.maxRating;
  static int presentRating = stats.CodeforcesPerformance.presentRating;
  static String designation = stats.CodeforcesPerformance.designation;
  static List<dynamic> list = stats.CodeforcesPerformance.ratings;
  static double maxX = 25;
  static List<FlSpot> flspots = [];

  static Widget StatsCard() {
    username = stats.CodeforcesPerformance.username;
    maxRating = stats.CodeforcesPerformance.maxRating;
    presentRating = stats.CodeforcesPerformance.presentRating;
    designation = stats.CodeforcesPerformance.designation;
    list = stats.CodeforcesPerformance.ratings;
    maxX = (list.length / 10 + 1) * 10;
    list = list.reversed.toList();

    if (flspots.isEmpty) {
      for (int j = 0; j < list.length; j++) {
        flspots.add(FlSpot((j + 1).toDouble(), list[j].toDouble()));
      }
    }
    return Container(
      margin: EdgeInsets.only(top: 30),
      decoration: BoxDecoration(
        color: Color(0xff2a2a2a).withOpacity(0.2),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeadingText1(text: "Codeforces"),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.only(right: 25),
            child: AspectRatio(
              aspectRatio: 1.5,
              child: LineChart(
                LineChartData(
                  minX: 0,
                  maxX: maxX,
                  minY: 0,
                  maxY: 2500,
                  lineBarsData: [
                    LineChartBarData(
                      spots: flspots,
                      colors: [Colors.white],
                      dotData: FlDotData(
                        show: true,
                        getDotPainter: (spot, percent, barData, index) =>
                            FlDotCirclePainter(
                                radius: 1.5,
                                color: Colors.white.withOpacity(1)),
                      ),
                    ),
                  ],
                  gridData: FlGridData(show: false),
                  axisTitleData: FlAxisTitleData(
                    leftTitle: AxisTitle(
                      showTitle: true,
                      titleText: 'Rating->',
                      textStyle: TextStyle(color: Colors.white, fontSize: 10.0),
                    ),
                    bottomTitle: AxisTitle(
                        showTitle: true,
                        titleText: 'No of contest->',
                        textStyle:
                            TextStyle(color: Colors.white, fontSize: 10.0),
                        textAlign: TextAlign.center),
                  ),
                  titlesData: FlTitlesData(
                    rightTitles: SideTitles(
                      showTitles: false,
                    ),
                    topTitles: SideTitles(showTitles: false),
                    leftTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 30.0,
                      getTextStyles: (context, value) =>
                          const TextStyle(color: Colors.white, fontSize: 10.0),
                    ),
                    bottomTitles: SideTitles(
                      showTitles: true,
                      getTextStyles: (context, value) =>
                          const TextStyle(color: Colors.white, fontSize: 10.0),
                    ),
                  ),
                  borderData: FlBorderData(
                    show: true,
                    border: const Border(
                      left: BorderSide(color: Colors.white),
                      top: BorderSide(color: Colors.transparent),
                      bottom: BorderSide(color: Colors.white),
                      right: BorderSide(color: Colors.transparent),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 7.5, top: 3, bottom: 3),
                    child: SizedBox(
                      height: 70,
                      width: 50,
                      child: Image.asset('images/codeforces.png'),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Divider(
                      indent: 5,
                      endIndent: 5,
                      color: Colors.white,
                      height: 15,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 10),
                        Text(
                          username,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 7.5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Max Rating : ',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                            Text(
                              maxRating.toString(),
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white.withOpacity(0.5)),
                            ),
                            SizedBox(width: 30),
                            Text(
                              'Current Rating : ',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                            Text(
                              presentRating.toString(),
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white.withOpacity(0.5)),
                            )
                          ],
                        ),
                        SizedBox(height: 7.5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              designation,
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10)
        ],
      ),
    );
  }
}

class LeetCode {
  static String username = stats.LeetCodePerformance.username;
  static String problemsSolved = stats.LeetCodePerformance.problemSolved;
  static String acceptanceRate = stats.LeetCodePerformance.acceptanceRate;
  static String hard = stats.LeetCodePerformance.hard;
  static String easy = stats.LeetCodePerformance.medium;
  static String medium = stats.LeetCodePerformance.easy;

  static Widget StatsCard() {
    username = stats.LeetCodePerformance.username;
    problemsSolved = stats.LeetCodePerformance.problemSolved;
    acceptanceRate = stats.LeetCodePerformance.acceptanceRate;
    hard = stats.LeetCodePerformance.hard;
    easy = stats.LeetCodePerformance.medium;
    medium = stats.LeetCodePerformance.easy;

    return Container(
      margin: EdgeInsets.only(top: 30),
      decoration: BoxDecoration(
        color: Color(0xff2a2a2a).withOpacity(0.2),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeadingText1(text: "Leetcode"),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 7.5, top: 3, bottom: 3),
                    child: SizedBox(
                      height: 70,
                      width: 50,
                      child: Image.asset('images/leetcode.png'),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Divider(
                      indent: 5,
                      endIndent: 5,
                      color: Colors.white,
                      height: 15,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 10),
                        Text(
                          username,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 7.5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Problem Solved : ',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                            Text(
                              problemsSolved,
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white.withOpacity(0.5)),
                            ),
                          ],
                        ),
                        SizedBox(height: 7.5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Acceptance Rate',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                            Text(
                              acceptanceRate,
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white.withOpacity(0.5)),
                            ),
                          ],
                        ),
                        SizedBox(height: 7.5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Hard: ',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                            Text(
                              hard,
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white.withOpacity(0.5)),
                            ),
                            SizedBox(width: 10),
                            Text(
                              'Medium: ',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                            Text(
                              medium,
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white.withOpacity(0.5)),
                            ),
                            SizedBox(width: 10),
                            Text(
                              'Easy: ',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                            Text(
                              easy,
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white.withOpacity(0.5)),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10)
        ],
      ),
    );
  }
}

class AtCoder {
  static String username = stats.AtcoderPerformance.username;
  static int maxRating = stats.AtcoderPerformance.maxRating;
  static int presentRating = stats.AtcoderPerformance.presentRating;
  static String designation = stats.AtcoderPerformance.designation;
  static List<dynamic> list = stats.AtcoderPerformance.ratings;
  static double maxX = 25;
  static List<FlSpot> flspots = [];

  static Widget StatsCard() {
    username = stats.AtcoderPerformance.username;
    maxRating = stats.AtcoderPerformance.maxRating;
    presentRating = stats.AtcoderPerformance.presentRating;
    designation = stats.AtcoderPerformance.designation;
    list = stats.AtcoderPerformance.ratings;
    maxX = (list.length / 10 + 1) * 10;

    if (flspots.isEmpty) {
      for (int j = 0; j < list.length; j++) {
        flspots.add(FlSpot((j + 1).toDouble(), list[j].toDouble()));
      }
    }
    return Container(
      margin: EdgeInsets.only(top: 30),
      decoration: BoxDecoration(
        color: Color(0xff2a2a2a).withOpacity(0.2),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeadingText1(text: "Atcoder"),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.only(right: 25),
            child: AspectRatio(
              aspectRatio: 1.5,
              child: LineChart(
                LineChartData(
                  minX: 0,
                  maxX: maxX,
                  minY: 0,
                  maxY: 2500,
                  lineBarsData: [
                    LineChartBarData(
                      spots: flspots,
                      colors: [Colors.white],
                      dotData: FlDotData(
                        show: true,
                        getDotPainter: (spot, percent, barData, index) =>
                            FlDotCirclePainter(
                                radius: 1.5,
                                color: Colors.white.withOpacity(1)),
                      ),
                    ),
                  ],
                  gridData: FlGridData(show: false),
                  axisTitleData: FlAxisTitleData(
                    leftTitle: AxisTitle(
                      showTitle: true,
                      titleText: 'Rating->',
                      textStyle: TextStyle(color: Colors.white, fontSize: 10.0),
                    ),
                    bottomTitle: AxisTitle(
                        showTitle: true,
                        titleText: 'No of contest->',
                        textStyle:
                            TextStyle(color: Colors.white, fontSize: 10.0),
                        textAlign: TextAlign.center),
                  ),
                  titlesData: FlTitlesData(
                    rightTitles: SideTitles(
                      showTitles: false,
                    ),
                    topTitles: SideTitles(showTitles: false),
                    leftTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 30.0,
                      getTextStyles: (context, value) =>
                          const TextStyle(color: Colors.white, fontSize: 10.0),
                    ),
                    bottomTitles: SideTitles(
                      showTitles: true,
                      getTextStyles: (context, value) =>
                          const TextStyle(color: Colors.white, fontSize: 10.0),
                    ),
                  ),
                  borderData: FlBorderData(
                    show: true,
                    border: const Border(
                      left: BorderSide(color: Colors.white),
                      top: BorderSide(color: Colors.transparent),
                      bottom: BorderSide(color: Colors.white),
                      right: BorderSide(color: Colors.transparent),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 7.5, top: 3, bottom: 3),
                    child: SizedBox(
                      height: 70,
                      width: 50,
                      child: Image.asset('images/atcoder.png'),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Divider(
                      indent: 5,
                      endIndent: 5,
                      color: Colors.white,
                      height: 15,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 10),
                        Text(
                          username,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 7.5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Max Rating : ',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                            Text(
                              maxRating.toString(),
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white.withOpacity(0.5)),
                            ),
                            SizedBox(width: 30),
                            Text(
                              'Current Rating : ',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                            Text(
                              presentRating.toString(),
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white.withOpacity(0.5)),
                            )
                          ],
                        ),
                        SizedBox(height: 7.5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              designation,
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10)
        ],
      ),
    );
  }
}

class HackerRank {}

class HackerEarth {}

class Kickstart {}
