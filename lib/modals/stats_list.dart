import 'dart:convert';

import 'package:coders_castle/data_fetching/networking.dart';

class CodeChefPerformance {
  static String username;
  static int maxRating;
  static int presentRating;
  static String designation;
  static String status = 'Failure';
  static var ratings = [];

  void getPerformanceInfo() async {
    if (status.compareTo('Success') == 0) return;
    String s = "https://cping-api2.herokuapp.com/api/codechef/rahulladi8686";
    Uri url = Uri.parse(s);
    NetworkHelper networkHelper = NetworkHelper(url);
    var contestData = await networkHelper.getData();
    var decodeData = jsonDecode(contestData);
    if (decodeData['status'] == 'Failed') {
      username = null;
      return;
    }
    username = 'rahulladi8686';
    presentRating = decodeData['rating'];
    maxRating = decodeData['highest_rating'];
    designation = decodeData['stars'];
    ratings = decodeData['contest_ratings'];
    status = decodeData['status'].toString();
    print(ratings);
  }
}

class CodeforcesPerformance {
  static String username;
  static int maxRating;
  static int presentRating;
  static String designation;
  static String status = 'Failure';
  static var ratings = [];

  void getPerformanceInfo() async {
    if (status.compareTo('Success') == 0) return;
    String s = "https://cping-api2.herokuapp.com/api/codeforces/rahulladi8686";
    Uri url = Uri.parse(s);
    NetworkHelper networkHelper = NetworkHelper(url);
    var contestData = await networkHelper.getData();
    var decodeData = jsonDecode(contestData);
    if (decodeData['status'] == 'Failed') {
      username = null;
      return;
    }
    username = 'rahulladi8686';
    presentRating = decodeData['rating'];
    maxRating = decodeData['max rating'];
    designation = decodeData['max rank'];
    ratings = decodeData['contests'];
    status = decodeData['status'].toString();
    print(ratings);
  }
}

class AtcoderPerformance {
  static String username;
  static int maxRating;
  static int presentRating;
  static String designation;
  static String status = 'Failure';
  static var ratings = [];

  void getPerformanceInfo() async {
    if (status.compareTo('Success') == 0) return;
    String s = "https://cping-api2.herokuapp.com/api/atcoder/chinmay0402";
    Uri url = Uri.parse(s);
    NetworkHelper networkHelper = NetworkHelper(url);
    var contestData = await networkHelper.getData();
    var decodeData = jsonDecode(contestData);
    if (decodeData['status'] == 'Failed') {
      username = null;
      return;
    }
    username = 'chinmay0402';
    presentRating = decodeData['rating'];
    maxRating = decodeData['highest'];
    designation = decodeData['level'];
    ratings = decodeData['contest_ratings'];
    status = decodeData['status'].toString();
    print(ratings);
  }
}

class LeetCodePerformance {
  static String username;
  static String problemSolved;
  static String acceptanceRate;
  static String hard;
  static String easy;
  static String medium;
  static String status = 'Failure';

  void getPerformanceInfo() async {
    if (status.compareTo('Success') == 0) return;
    String s = "https://cping-api2.herokuapp.com/api/leetcode/chinmay0402";
    Uri url = Uri.parse(s);
    NetworkHelper networkHelper = NetworkHelper(url);
    var contestData = await networkHelper.getData();
    var decodeData = jsonDecode(contestData);
    if (decodeData['status'] == 'Failed') {
      username = null;
      return;
    }
    username = 'chinmay0402';
    problemSolved = decodeData['total_problems_solved'];
    acceptanceRate = decodeData['acceptance_rate'];
    hard = decodeData['hard_questions_solved'];
    medium = decodeData['medium_questions_solved'];
    easy = decodeData['easy_questions_solved'];
    status = decodeData['status'];
    print(acceptanceRate);
  }
}
