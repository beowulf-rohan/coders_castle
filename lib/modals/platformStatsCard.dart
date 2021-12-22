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

Widget EmptyUsernameContainer(String platform) {
  return Container(
    margin: EdgeInsets.only(top: 30),
    decoration: BoxDecoration(
      color: Color(0xff2a2a2a).withOpacity(0.2),
      borderRadius: BorderRadius.circular(15),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //HeadingText1(text: platform,),
        SizedBox(
          height: 10,
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
                  padding: const EdgeInsets.only(left: 7.5, top: 3, bottom: 3),
                  child: SizedBox(
                    height: 70,
                    width: 50,
                    child: Image.asset('images/${platform.toLowerCase()}.png'),
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
                      Text(
                        'Please enter a',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'valid username',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'to see your stats',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'for this platform',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
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
        SizedBox(
          height: 20,
        ),
      ],
    ),
  );
}

class Codechef {
  static String username = stats.CodeChefPerformance.username;
  static int maxRating = stats.CodeChefPerformance.maxRating;
  static int presentRating = stats.CodeChefPerformance.presentRating;
  static String designation = stats.CodeChefPerformance.designation;
  static List<dynamic> list = stats.CodeChefPerformance.ratings;
  static double maxX = 25;
  static double maxY;
  static List<FlSpot> flspots = [];
  static Color color1;
  static Color color2;
  static String status;

  static Widget StatsCard() {
    status = stats.CodeChefPerformance.status;
    username = stats.CodeChefPerformance.username;
    maxRating = stats.CodeChefPerformance.maxRating;
    presentRating = stats.CodeChefPerformance.presentRating;
    designation = stats.CodeChefPerformance.designation;
    list = stats.CodeChefPerformance.ratings;
    if (username == null ||
        username.length == 0 ||
        status.compareTo('Failure') == 0) {
      return EmptyUsernameContainer('Codechef');
    }
    maxX = (list.length / 10 + 1) * 10;
    maxY = (maxRating.toDouble() / 500 + 1) * 500;
    if (maxRating < 1400) {
      designation = '★';
      color1 = Color(0xff666666);
    } else if (maxRating < 1600) {
      designation = '★★';
      color1 = Color(0xff1E7D22);
    } else if (maxRating < 1800) {
      designation = '★★★';
      color1 = Color(0xff3366CC);
    } else if (maxRating < 2000) {
      designation = '★★★★';
      color1 = Color(0xff684273);
    } else if (maxRating < 2200) {
      designation = '★★★★★';
      color1 = Color(0xffFFD819);
      //#FFD819
    } else if (maxRating < 2400) {
      designation = '★★★★★★';
      color1 = Color(0xffFF9819);
    } else {
      designation = '★★★★★★★';
      color1 = Color(0xffE91A34);
    }

    if (presentRating < 1400) {
      color2 = Color(0xff666666);
    } else if (presentRating < 1600) {
      color2 = Color(0xff1E7D22);
    } else if (presentRating < 1800) {
      color2 = Color(0xff3366CC);
    } else if (presentRating < 2000) {
      color2 = Color(0xff684273);
    } else if (presentRating < 2200) {
      color2 = Color(0xffFFD819);
      //#FFD819
    } else if (presentRating < 2400) {
      color2 = Color(0xffFF9819);
    } else {
      color2 = Color(0xffE91A34);
    }
    flspots = [];
    for (int j = 0; j < list.length; j++) {
      flspots.add(FlSpot((j + 1).toDouble(), list[j].toDouble()));
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
                  maxY: maxY,
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
                                color: color1,
                              ),
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
                                color: color2,
                              ),
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
                                color: color1,
                              ),
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
  static double maxY;
  static List<FlSpot> flspots = [];
  static String status;
  static Color color1;
  static Color color2;

  static Widget StatsCard() {
    username = stats.CodeforcesPerformance.username;
    maxRating = stats.CodeforcesPerformance.maxRating;
    presentRating = stats.CodeforcesPerformance.presentRating;
    designation = stats.CodeforcesPerformance.designation;
    list = stats.CodeforcesPerformance.ratings;
    status = stats.CodeforcesPerformance.status;
    if (username == null ||
        username.length == 0 ||
        status.compareTo('Failure') == 0) {
      return EmptyUsernameContainer('Codeforces');
    }

    maxX = (list.length / 10 + 1) * 10;
    list = list.reversed.toList();
    maxY = (maxRating.toDouble() / 500 + 1) * 500;

    flspots = [];
    for (int j = 0; j < list.length; j++) {
      flspots.add(FlSpot((j + 1).toDouble(), list[j].toDouble()));
    }

    if (maxRating < 1200) {
      color1 = Color(0xffCCCCCC);
    } else if (maxRating < 1400) {
      color1 = Color(0xff77FF77);
    } else if (maxRating < 1600) {
      color1 = Color(0xff77DDBB);
    } else if (maxRating < 1900) {
      color1 = Color(0xffAAAAFF);
    } else if (maxRating < 2100) {
      color1 = Color(0xffff88ff);
      //#FFD819
    } else if (maxRating < 2300) {
      color1 = Color(0xffFFCC88);
    } else if (maxRating < 2400) {
      color1 = Color(0xffFFBB55);
    } else if (maxRating < 2600) {
      color1 = Color(0xffFF7777);
    } else if (maxRating < 3000) {
      color1 = Color(0xffFF3333);
    } else {
      color1 = Color(0xffAA0000);
    }

    if (presentRating < 1200) {
      color2 = Color(0xffCCCCCC);
    } else if (presentRating < 1400) {
      color2 = Color(0xff77FF77);
    } else if (presentRating < 1600) {
      color2 = Color(0xff77DDBB);
    } else if (presentRating < 1900) {
      color2 = Color(0xffAAAAFF);
    } else if (presentRating < 2100) {
      color2 = Color(0xffff88ff);
      //#FFD819
    } else if (presentRating < 2300) {
      color2 = Color(0xffFFCC88);
    } else if (presentRating < 2400) {
      color2 = Color(0xffFFBB55);
    } else if (presentRating < 2600) {
      color2 = Color(0xffFF7777);
    } else if (presentRating < 3000) {
      color2 = Color(0xffFF3333);
    } else {
      color2 = Color(0xffAA0000);
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
                  maxY: maxY,
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
                                  color: color1),
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
                                color: color2,
                              ),
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
                                  color: color1),
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
  static String status;
  static double maxY;

  static Widget StatsCard() {
    username = stats.LeetCodePerformance.username;
    problemsSolved = stats.LeetCodePerformance.problemSolved;
    acceptanceRate = stats.LeetCodePerformance.acceptanceRate;
    hard = stats.LeetCodePerformance.hard;
    easy = stats.LeetCodePerformance.medium;
    medium = stats.LeetCodePerformance.easy;
    status = stats.LeetCodePerformance.status;

    if (username == null ||
        username.length == 0 ||
        status.compareTo('Failure') == 0) {
      return EmptyUsernameContainer('Leetcode');
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
  static Color color1;
  static Color color2;
  static String status;
  static double maxY;

  static Widget StatsCard() {
    username = stats.AtcoderPerformance.username;
    maxRating = stats.AtcoderPerformance.maxRating;
    presentRating = stats.AtcoderPerformance.presentRating;
    designation = stats.AtcoderPerformance.designation;
    list = stats.AtcoderPerformance.ratings;
    status = stats.AtcoderPerformance.status;
    if (username == null ||
        username.length == 0 ||
        status.compareTo('Failure') == 0) {
      return EmptyUsernameContainer('Atcoder');
    }
    maxX = (list.length / 10 + 1) * 10;
    maxY = (maxRating.toDouble() / 500 + 1) * 500;
    flspots = [];
    for (int j = 0; j < list.length; j++) {
      flspots.add(FlSpot((j + 1).toDouble(), list[j].toDouble()));
    }

    if (maxRating < 400) {
      color1 = Color(0xff797979);
    } else if (maxRating < 800) {
      color1 = Color(0xff7E3F00);
    } else if (maxRating < 1200) {
      color1 = Color(0xff008000);
    } else if (maxRating < 1600) {
      color1 = Color(0xff00BFBF);
    } else if (maxRating < 2000) {
      color1 = Color(0xff0000F4);
      //#FFD819
    } else if (maxRating < 2400) {
      color1 = Color(0xffC0C000);
    } else if (maxRating < 2800) {
      color1 = Color(0xffFF8000);
    } else if (maxRating < 3000) {
      color1 = Color(0xffF50000);
    } else if (maxRating < 3200) {
      color1 = Color(0xffF5A3A3);
    } else {
      color1 = Color(0xffF00F0F);
    }

    if (presentRating < 400) {
      color2 = Color(0xff797979);
    } else if (presentRating < 800) {
      color2 = Color(0xff7E3F00);
    } else if (presentRating < 1200) {
      color2 = Color(0xff008000);
    } else if (presentRating < 1600) {
      color2 = Color(0xff00BFBF);
    } else if (presentRating < 2000) {
      color2 = Color(0xff0000F4);
      //#FFD819
    } else if (presentRating < 2400) {
      color2 = Color(0xffC0C000);
    } else if (presentRating < 2800) {
      color2 = Color(0xffFF8000);
    } else if (presentRating < 3000) {
      color2 = Color(0xffF50000);
    } else if (presentRating < 3200) {
      color2 = Color(0xffF5A3A3);
    } else {
      color2 = Color(0xffF00F0F);
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
                  maxY: maxY,
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
                                  color: color1),
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
                                  color: color2),
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
                                  color: color1),
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
