// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:coders_castle/data_fetching/networking.dart';

class CodeChefPerformance {
  static String username;
  static int maxRating;
  static int presentRating;
  static String designation;
  static String status = 'Failed';
  static var ratings = [];

  Future<void> getPerformanceInfo(String user) async {
    username = user;
    if (user == null || user.isEmpty) {
      status = 'Failed';
      return;
    }
    String s = "https://cping-api2.herokuapp.com/api/codechef/$user";
    Uri url = Uri.parse(s);
    NetworkHelper networkHelper = NetworkHelper(url);
    var contestData = await networkHelper.getData();
    if (contestData == null) {
      username = null;
      status = 'Failed';
      return;
    }
    var decodeData = jsonDecode(contestData);
    if (decodeData == null || decodeData['status'] == 'Failed') {
      username = null;
      status = 'Failed';
      return;
    }
    status = decodeData['status'].toString();
    username = user;
    presentRating = decodeData['rating'];
    maxRating = decodeData['highest_rating'];
    designation = decodeData['stars'];
    ratings = decodeData['contest_ratings'];
    //print(ratings);
  }
}

class CodeforcesPerformance {
  static String username;
  static int maxRating;
  static int presentRating;
  static String designation;
  static String status = 'Failed';
  static var ratings = [];

  Future<void> getPerformanceInfo(String user) async {
    username = user;
    if (user == null || user.isEmpty) {
      status = 'Failed';
      return;
    }
    String s = "https://cping-api2.herokuapp.com/api/codeforces/$user";
    Uri url = Uri.parse(s);
    NetworkHelper networkHelper = NetworkHelper(url);
    var contestData = await networkHelper.getData();
    if (contestData == null) {
      username = null;
      status = 'Failed';
      return;
    }
    var decodeData = jsonDecode(contestData);
    if (decodeData == null || decodeData['status'] == 'Failed') {
      username = null;
      status = 'Failed';
      return;
    }
    status = decodeData['status'].toString();
    username = user;
    presentRating = decodeData['rating'];
    maxRating = decodeData['max rating'];
    designation = decodeData['max rank'];
    ratings = decodeData['contests'];
    status = decodeData['status'].toString();
    //print(ratings);
  }
}

class AtcoderPerformance {
  static String username;
  static int maxRating;
  static int presentRating;
  static String designation;
  static String status = 'Failed';
  static var ratings = [];

  Future<void> getPerformanceInfo(String user) async {
    username = user;
    if (user == null || user.isEmpty) {
      status = 'Failed';
      return;
    }
    String s = "https://cping-api2.herokuapp.com/api/atcoder/$user";
    Uri url = Uri.parse(s);
    NetworkHelper networkHelper = NetworkHelper(url);
    var contestData = await networkHelper.getData();
    if (contestData == null) {
      username = null;
      status = 'Failed';
      return;
    }
    var decodeData = jsonDecode(contestData);
    if (decodeData == null || decodeData['status'] == 'Failed') {
      username = null;
      status = 'Failed';
      return;
    }
    status = decodeData['status'].toString();
    username = user;
    presentRating = decodeData['rating'];
    maxRating = decodeData['highest'];
    designation = decodeData['level'];
    ratings = decodeData['contest_ratings'];
    status = decodeData['status'].toString();
    //print(ratings);
  }
}

class LeetCodePerformance {
  static String username;
  static String problemSolved;
  static String acceptanceRate;
  static String hard;
  static String easy;
  static String medium;
  static String status = 'Failed';

  Future<void> getPerformanceInfo(String user) async {
    username = user;
    if (user == null || user.isEmpty) {
      status = 'Failed';
      return;
    }
    String s = "https://cping-api2.herokuapp.com/api/leetcode/$user";
    Uri url = Uri.parse(s);
    NetworkHelper networkHelper = NetworkHelper(url);
    var contestData = await networkHelper.getData();
    if (contestData == null) {
      username = null;
      status = 'Failed';
      return;
    }
    var decodeData = jsonDecode(contestData);
    if (decodeData == null || decodeData['status'] == 'Failed') {
      username = null;
      status = 'Failed';
      return;
    }
    status = decodeData['status'].toString();
    username = user;
    problemSolved = decodeData['total_problems_solved'];
    acceptanceRate = decodeData['acceptance_rate'];
    hard = decodeData['hard_questions_solved'];
    medium = decodeData['medium_questions_solved'];
    easy = decodeData['easy_questions_solved'];
    status = decodeData['status'];
    //print(acceptanceRate);
  }
}
