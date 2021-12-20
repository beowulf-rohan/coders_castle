// ignore_for_file: prefer_const_constructors

import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

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
  static String username = 'rahulladi';
  static String maxRating = '1700';
  static String presentRating = '1679';
  static String designation = '4 star';

  static Widget StatsCard() {
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
                  maxX: 25,
                  minY: 0,
                  maxY: 2000,
                  lineBarsData: [
                    LineChartBarData(
                      spots: [
                        FlSpot(0, 100),
                        FlSpot(1, 1000),
                        FlSpot(2, 1100),
                        FlSpot(3, 900),
                        FlSpot(4, 1100),
                        FlSpot(5, 1209),
                        FlSpot(6, 1300),
                        FlSpot(7, 1100),
                        FlSpot(8, 2000),
                        FlSpot(9, 1300),
                        FlSpot(10, 1100),
                        FlSpot(11, 1209),
                        FlSpot(12, 1300),
                        FlSpot(13, 1100),
                        FlSpot(14, 1209),
                        FlSpot(15, 100),
                        FlSpot(16, 1100),
                        FlSpot(17, 1209),
                        FlSpot(18, 1300),
                      ],
                      colors: [Colors.white],
                      dotData: FlDotData(
                        show: true,
                        getDotPainter: (spot, percent, barData, index) =>
                            FlDotCirclePainter(
                                radius: 3, color: Colors.white.withOpacity(1)),
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
                          'username',
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
                              maxRating,
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
                              presentRating,
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
  static String username = 'rahulladi';
  static String maxRating = '1700';
  static String presentRating = '1679';
  static String maxDesignation = 'master';
  static String presentDesignation = 'pupil';
  static Widget StatsCard() {
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
                  maxX: 25,
                  minY: 0,
                  maxY: 2000,
                  lineBarsData: [
                    LineChartBarData(
                      spots: [
                        FlSpot(0, 100),
                        FlSpot(1, 1000),
                        FlSpot(2, 1100),
                        FlSpot(3, 900),
                        FlSpot(4, 1100),
                        FlSpot(5, 1209),
                        FlSpot(6, 1300),
                        FlSpot(7, 1100),
                        FlSpot(8, 2000),
                        FlSpot(9, 1300),
                        FlSpot(10, 1100),
                        FlSpot(11, 1209),
                        FlSpot(12, 1300),
                        FlSpot(13, 1100),
                        FlSpot(14, 1209),
                        FlSpot(15, 100),
                        FlSpot(16, 1100),
                        FlSpot(17, 1209),
                        FlSpot(18, 1300),
                      ],
                      colors: [Colors.white],
                      dotData: FlDotData(
                        show: true,
                        getDotPainter: (spot, percent, barData, index) =>
                            FlDotCirclePainter(
                                radius: 3, color: Colors.white.withOpacity(1)),
                      ),
                    ),
                  ],
                  gridData: FlGridData(show: false),
                  titlesData: FlTitlesData(
                    rightTitles: SideTitles(
                      showTitles: false,
                    ),
                    topTitles: SideTitles(showTitles: false),
                    leftTitles: SideTitles(
                      reservedSize: 30.0,
                      showTitles: true,
                      getTextStyles: (context, value) =>
                          const TextStyle(color: Colors.white, fontSize: 10.0),
                    ),
                    bottomTitles: SideTitles(
                      showTitles: true,
                      getTextStyles: (context, value) =>
                          const TextStyle(color: Colors.white, fontSize: 10.0),
                    ),
                  ),
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
                          'username',
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
                              maxRating,
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
                              presentRating,
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white.withOpacity(0.5)),
                            )
                          ],
                        ),
                        SizedBox(height: 7.5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              maxDesignation,
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                            Text(
                              presentDesignation,
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
                  SizedBox(height: 20)
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
  static String username = 'rahulladi';
  static String problemsSolved = '250';
  static String acceptanceRate = '50%';
  static String hard = '10';
  static String easy = '52';
  static String medium = '100';
  static Widget StatsCard() {
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
                          'username',
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
  static String username = 'rahulladi';
  static String maxRating = '1700';
  static String presentRating = '1679';
  static String designation = 'master';
  static Widget StatsCard() {
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
                  maxX: 25,
                  minY: 0,
                  maxY: 2000,
                  lineBarsData: [
                    LineChartBarData(
                      spots: [
                        FlSpot(0, 100),
                        FlSpot(1, 1000),
                        FlSpot(2, 1100),
                        FlSpot(3, 900),
                        FlSpot(4, 1100),
                        FlSpot(5, 1209),
                        FlSpot(6, 1300),
                        FlSpot(7, 1100),
                        FlSpot(8, 2000),
                        FlSpot(9, 1300),
                        FlSpot(10, 1100),
                        FlSpot(11, 1209),
                        FlSpot(12, 1300),
                        FlSpot(13, 1100),
                        FlSpot(14, 1209),
                        FlSpot(15, 100),
                        FlSpot(16, 1100),
                        FlSpot(17, 1209),
                        FlSpot(18, 1300),
                      ],
                      colors: [Colors.white],
                      dotData: FlDotData(
                        show: true,
                        getDotPainter: (spot, percent, barData, index) =>
                            FlDotCirclePainter(
                                radius: 3, color: Colors.white.withOpacity(1)),
                      ),
                    ),
                  ],
                  gridData: FlGridData(show: false),
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
                          'username',
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
                              maxRating,
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
                              presentRating,
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
                  SizedBox(height: 20)
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
