// ignore_for_file: non_constant_identifier_names, avoid_print

import 'dart:convert';
import 'package:coders_castle/data_fetching/networking.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';

class FormattedTime {
  String formatedTime(int secTime) {
    int days = secTime ~/ (60 * 24);
    secTime = secTime % (60 * 24);
    int hours = secTime ~/ 60;
    secTime = secTime % 60;
    int minutes = secTime ~/ 1;
    String duration = "";
    if (days != 0) {
      duration += days.toString() + " d ";
    }
    if (hours != 0) {
      duration += hours.toString() + " hr ";
    }
    if (minutes != 0) {
      duration += minutes.toString() + " min";
    }
    return duration;
  }
}

int compare(String a, String b) {
  int year1, year2, month1, month2, day1, day2, hour1, hour2, min1, min2;
  //print(a.date);
  String s = a[6] + a[7] + a[8] + a[9];
  year1 = int.parse(s);
  s = b[6] + b[7] + b[8] + b[9];
  year2 = int.parse(s);
  s = a[3] + a[4];
  month1 = int.parse(s);
  s = b[3] + b[4];
  month2 = int.parse(s);
  s = a[0] + a[1];
  day1 = int.parse(s);
  s = b[0] + b[1];
  day2 = int.parse(s);
  if (year1 != year2) {
    return year1 - year2;
  }

  if (month1 != month2) {
    return month1 - month2;
  }

  if (day1 != day2) {
    return day1 - day2;
  }

  return 0;
}

class All {
  static var pcontestName = [];
  static var pduration = [];
  static var pat = [];
  static var pon = [];
  static var plinks = [];
  static var fcontestName = [];
  static var fduration = [];
  static var fat = [];
  static var fon = [];
  static var flinks = [];

  Future<void> getContestInfo() async {
    String s = "https://www.kontests.net/api/v1/all";
    Uri url = Uri.parse(s);
    NetworkHelper networkHelper = NetworkHelper(url);
    var contestData = await networkHelper.getData();
    var decodeData = jsonDecode(contestData);
    int size = (decodeData as List<dynamic>).length;
    //print(size);
    DateTime presentTime = DateTime.now();
    String datetime = DateFormat("dd-MM-yyyy").format(presentTime);
    //print(datetime);
    for (int j = 0; j < size; j++) {
      String site = decodeData[j]['site'].toString();
      if ((site.compareTo('CodeChef') == 0 ||
              site.compareTo('CodeForces') == 0 ||
              site.compareTo('AtCoder') == 0 ||
              site.compareTo('Kick Start') == 0 ||
              site.compareTo('LeetCode') == 0) ==
          false) {
        continue;
      }

      String name = decodeData[j]['name'].toString();

      String sam = decodeData[j]['duration'].toString();
      double dou = double.parse(sam);
      int dur = dou.toInt();
      // var d2 = Duration(seconds: dur);
      dur = dur ~/ 60;
      var dura = (FormattedTime().formatedTime(dur));
      String url = decodeData[j]['url'].toString();

      String date_time = decodeData[j]['start_time'].toString();
      String date = "";
      for (int k = 8; k < 10; k++) {
        date += date_time[k];
      }
      date += '-';
      for (int k = 5; k < 7; k++) {
        date += date_time[k];
      }
      date += '-';
      for (int k = 0; k < 4; k++) {
        date += date_time[k];
      }
      String temp = "";
      for (int j = 0; j < 10; j++) {
        temp += date_time[j];
      }
      temp += 'T';
      for (int j = 11; j < 19; j++) {
        temp += date_time[j];
      }
      temp += '.000Z';
      if (site.compareTo('CodeChef') == 0) date_time = temp;
      var local_time = DateTime.parse(date_time);
      //print(local_time);
      //print(date);
      String contestDate = DateFormat.Hm().format(local_time.toLocal());
      if (compare(date, datetime) <= 0) {
        if (site.compareTo('CodeChef') == 0) {
          CodeChef.plinks.add(url);
          CodeChef.pduration.add(dura);
          CodeChef.pcontestName.add(name);
          CodeChef.pon.add(date);
          CodeChef.pat.add(DateFormat.Hm().format(local_time.toLocal()));
        } else if (site.compareTo('CodeForces') == 0) {
          Codeforces.plinks.add(url);
          Codeforces.pduration.add(dura);
          Codeforces.pcontestName.add(name);
          Codeforces.pon.add(date);
          Codeforces.pat.add(DateFormat.Hm().format(local_time.toLocal()));
        } else if (site.compareTo('AtCoder') == 0) {
          AtCoder.plinks.add(url);
          AtCoder.pduration.add(dura);
          AtCoder.pcontestName.add(name);
          AtCoder.pon.add(date);
          AtCoder.pat.add(DateFormat.Hm().format(local_time.toLocal()));
        } else if (site.compareTo('LeetCode') == 0) {
          LeetCode.plinks.add(url);
          LeetCode.pduration.add(dura);
          LeetCode.pcontestName.add(name);
          LeetCode.pon.add(date);
          LeetCode.pat.add(DateFormat.Hm().format(local_time.toLocal()));
        } else if (site.compareTo('Kick Start') == 0) {
          KickStart.plinks.add(url);
          KickStart.pduration.add(dura);
          KickStart.pcontestName.add(name);
          KickStart.pon.add(date);
          KickStart.pat.add(DateFormat.Hm().format(local_time.toLocal()));
        }
      } else {
        if (site.compareTo('CodeChef') == 0) {
          CodeChef.flinks.add(url);
          CodeChef.fduration.add(dura);
          CodeChef.fcontestName.add(name);
          CodeChef.fon.add(date);
          CodeChef.fat.add(DateFormat.Hm().format(local_time.toLocal()));
        } else if (site.compareTo('CodeForces') == 0) {
          Codeforces.flinks.add(url);
          Codeforces.fduration.add(dura);
          Codeforces.fcontestName.add(name);
          Codeforces.fon.add(date);
          Codeforces.fat.add(DateFormat.Hm().format(local_time.toLocal()));
        } else if (site.compareTo('AtCoder') == 0) {
          AtCoder.flinks.add(url);
          AtCoder.fduration.add(dura);
          AtCoder.fcontestName.add(name);
          AtCoder.fon.add(date);
          AtCoder.fat.add(DateFormat.Hm().format(local_time.toLocal()));
        } else if (site.compareTo('LeetCode') == 0) {
          LeetCode.flinks.add(url);
          LeetCode.fduration.add(dura);
          LeetCode.fcontestName.add(name);
          LeetCode.fon.add(date);
          LeetCode.fat.add(DateFormat.Hm().format(local_time.toLocal()));
        } else if (site.compareTo('Kick Start') == 0) {
          KickStart.flinks.add(url);
          KickStart.fduration.add(dura);
          KickStart.fcontestName.add(name);
          KickStart.fon.add(date);
          KickStart.fat.add(DateFormat.Hm().format(local_time.toLocal()));
        }
      }
    }
    //print(CodeChef.fcontestName);
  }
}

class Codeforces {
  static var pcontestName = [];
  static var pduration = [];
  static var pat = [];
  static var pon = [];
  static var plinks = [];
  static var fcontestName = [];
  static var fduration = [];
  static var fat = [];
  static var fon = [];
  static var flinks = [];

  Future<void> getContestInfo() async {
    String s = "https://www.kontests.net/api/v1/codeforces";
    Uri url = Uri.parse(s);
    NetworkHelper networkHelper = NetworkHelper(url);
    var contestData = await networkHelper.getData();
    var decodeData = jsonDecode(contestData);
    int size = (decodeData as List<dynamic>).length;
    //print(size);
    DateTime presentTime = DateTime.now();
    String datetime = DateFormat("dd-MM-yyyy").format(presentTime);
    //print(datetime);
    for (int j = 0; j < size; j++) {
      String name = decodeData[j]['name'].toString();

      String sam = decodeData[j]['duration'].toString();
      double temp = double.parse(sam);
      int dur = temp.toInt();
      // var d2 = Duration(seconds: dur);
      dur = dur ~/ 60;
      var dura = (FormattedTime().formatedTime(dur));
      String url = decodeData[j]['url'].toString();

      String date_time = decodeData[j]['start_time'].toString();
      String date = "";
      for (int k = 8; k < 10; k++) {
        date += date_time[k];
      }
      date += '-';
      for (int k = 5; k < 7; k++) {
        date += date_time[k];
      }
      date += '-';
      for (int k = 0; k < 4; k++) {
        date += date_time[k];
      }
      // String time = "";
      // for (int k = 11; k < 16; k++) {
      //   time += date_time[k];
      // }
      var local_time = DateTime.parse(date_time);
      //print(local_time);
      //print(date);
      String contestDate = DateFormat.Hm().format(local_time.toLocal());
      if (compare(date, datetime) <= 0) {
        plinks.add(url);
        pduration.add(dura);
        pcontestName.add(name);
        pon.add(date);
        pat.add(DateFormat.Hm().format(local_time.toLocal()));
      } else {
        flinks.add(url);
        fduration.add(dura);
        fcontestName.add(name);
        fon.add(date);
        fat.add(DateFormat.Hm().format(local_time.toLocal()));
      }
    }
    //print(fcontestName);
    //print(fduration);
  }
}

class AtCoder {
  static var pcontestName = [];
  static var pduration = [];
  static var pat = [];
  static var pon = [];
  static var plinks = [];
  static var fcontestName = [];
  static var fduration = [];
  static var fat = [];
  static var fon = [];
  static var flinks = [];

  Future<void> getContestInfo() async {
    String s = "https://www.kontests.net/api/v1/at_coder";
    Uri url = Uri.parse(s);
    NetworkHelper networkHelper = NetworkHelper(url);
    var contestData = await networkHelper.getData();
    var decodeData = jsonDecode(contestData);
    int size = (decodeData as List<dynamic>).length;
    //print(size);
    DateTime presentTime = DateTime.now();
    String datetime = DateFormat("dd-MM-yyyy").format(presentTime);
    //print(datetime);
    for (int j = 0; j < size; j++) {
      String name = decodeData[j]['name'].toString();

      String sam = decodeData[j]['duration'].toString();
      int dur = int.parse(sam);
      // var d2 = Duration(seconds: dur);
      dur = dur ~/ 60;
      var dura = (FormattedTime().formatedTime(dur));
      String url = decodeData[j]['url'].toString();

      String date_time = decodeData[j]['start_time'].toString();
      String date = "";
      for (int k = 8; k < 10; k++) {
        date += date_time[k];
      }
      date += '-';
      for (int k = 5; k < 7; k++) {
        date += date_time[k];
      }
      date += '-';
      for (int k = 0; k < 4; k++) {
        date += date_time[k];
      }
      // String time = "";
      // for (int k = 11; k < 16; k++) {
      //   time += date_time[k];
      // }
      var local_time = DateTime.parse(date_time);
      String contestDate = DateFormat.Hm().format(local_time.toLocal());
      String todayDate = DateFormat.Hm().format(presentTime.toLocal());
      if (compare(date, datetime) <= 0) {
        plinks.add(url);
        pduration.add(dura);
        pcontestName.add(name);
        pon.add(date);
        pat.add(DateFormat.Hm().format(local_time.toLocal()));
      } else {
        flinks.add(url);
        fduration.add(dura);
        fcontestName.add(name);
        fon.add(date);
        fat.add(DateFormat.Hm().format(local_time.toLocal()));
      }
    }
    //print(fcontestName);
    //print(fduration);
  }
}

class KickStart {
  static var pcontestName = [];
  static var pduration = [];
  static var pat = [];
  static var pon = [];
  static var plinks = [];
  static var fcontestName = [];
  static var fduration = [];
  static var fat = [];
  static var fon = [];
  static var flinks = [];

  Future<void> getContestInfo() async {
    String s = "https://www.kontests.net/api/v1/kick_start";
    Uri url = Uri.parse(s);
    NetworkHelper networkHelper = NetworkHelper(url);
    var contestData = await networkHelper.getData();
    var decodeData = jsonDecode(contestData);
    int size = (decodeData as List<dynamic>).length;
    //print(size);
    DateTime presentTime = DateTime.now();
    String datetime = DateFormat("dd-MM-yyyy").format(presentTime);
    //print(datetime);
    for (int j = 0; j < size; j++) {
      String name = decodeData[j]['name'].toString();

      String sam = decodeData[j]['duration'].toString();
      double temp = double.parse(sam);
      int dur = temp.toInt();
      // var d2 = Duration(seconds: dur);
      dur = dur ~/ 60;
      var dura = (FormattedTime().formatedTime(dur));
      String url = decodeData[j]['url'].toString();

      String date_time = decodeData[j]['start_time'].toString();
      String date = "";
      for (int k = 8; k < 10; k++) {
        date += date_time[k];
      }
      date += '-';
      for (int k = 5; k < 7; k++) {
        date += date_time[k];
      }
      date += '-';
      for (int k = 0; k < 4; k++) {
        date += date_time[k];
      }
      // String time = "";
      // for (int k = 11; k < 16; k++) {
      //   time += date_time[k];
      // }
      var local_time = DateTime.parse(date_time);
      String contestDate = DateFormat.Hm().format(local_time.toLocal());
      String todayDate = DateFormat.Hm().format(presentTime.toLocal());
      if (compare(date, datetime) <= 0) {
        plinks.add(url);
        pduration.add(dura);
        pcontestName.add(name);
        pon.add(date);
        pat.add(DateFormat.Hm().format(local_time.toLocal()));
      } else {
        flinks.add(url);
        fduration.add(dura);
        fcontestName.add(name);
        fon.add(date);
        fat.add(DateFormat.Hm().format(local_time.toLocal()));
      }
    }
    //print(fcontestName);
    //print(fduration);
  }
}

class LeetCode {
  static var pcontestName = [];
  static var pduration = [];
  static var pat = [];
  static var pon = [];
  static var plinks = [];
  static var fcontestName = [];
  static var fduration = [];
  static var fat = [];
  static var fon = [];
  static var flinks = [];

  Future<void> getContestInfo() async {
    String s = "https://www.kontests.net/api/v1/leet_code";
    Uri url = Uri.parse(s);
    NetworkHelper networkHelper = NetworkHelper(url);
    var contestData = await networkHelper.getData();
    var decodeData = jsonDecode(contestData);
    int size = (decodeData as List<dynamic>).length;
    //print(size);
    DateTime presentTime = DateTime.now();
    String datetime = DateFormat("dd-MM-yyyy").format(presentTime);
    //print(datetime);
    for (int j = 0; j < size; j++) {
      String name = decodeData[j]['name'].toString();

      String sam = decodeData[j]['duration'].toString();
      int dur = int.parse(sam);
      // var d2 = Duration(seconds: dur);
      dur = dur ~/ 60;
      var dura = (FormattedTime().formatedTime(dur));
      String url = decodeData[j]['url'].toString();

      String date_time = decodeData[j]['start_time'].toString();
      String date = "";
      for (int k = 8; k < 10; k++) {
        date += date_time[k];
      }
      date += '-';
      for (int k = 5; k < 7; k++) {
        date += date_time[k];
      }
      date += '-';
      for (int k = 0; k < 4; k++) {
        date += date_time[k];
      }
      // String time = "";
      // for (int k = 11; k < 16; k++) {
      //   time += date_time[k];
      // }
      var local_time = DateTime.parse(date_time);
      String contestDate = DateFormat.Hm().format(local_time.toLocal());
      String todayDate = DateFormat.Hm().format(presentTime.toLocal());
      if (compare(date, datetime) <= 0) {
        plinks.add(url);
        pduration.add(dura);
        pcontestName.add(name);
        pon.add(date);
        pat.add(DateFormat.Hm().format(local_time.toLocal()));
      } else {
        flinks.add(url);
        fduration.add(dura);
        fcontestName.add(name);
        fon.add(date);
        fat.add(DateFormat.Hm().format(local_time.toLocal()));
      }
    }
    //print(fcontestName);
    //print(fduration);
  }
}

class CodeChef {
  static var pcontestName = [];
  static var pduration = [];
  static var pat = [];
  static var pon = [];
  static var plinks = [];
  static var fcontestName = [];
  static var fduration = [];
  static var fat = [];
  static var fon = [];
  static var flinks = [];

  Future<void> getContestInfo() async {
    String s = "https://www.kontests.net/api/v1/code_chef";
    Uri url = Uri.parse(s);
    NetworkHelper networkHelper = NetworkHelper(url);
    var contestData = await networkHelper.getData();
    var decodeData = jsonDecode(contestData);
    int size = (decodeData as List<dynamic>).length;
    //print(size);
    DateTime presentTime = DateTime.now();
    String datetime = DateFormat("dd-MM-yyyy").format(presentTime);
    //print(datetime);
    for (int j = 0; j < size; j++) {
      String name = decodeData[j]['name'].toString();

      String sam = decodeData[j]['duration'].toString();
      int dur = int.parse(sam);
      // var d2 = Duration(seconds: dur);
      dur = dur ~/ 60;
      var dura = (FormattedTime().formatedTime(dur));
      String url = decodeData[j]['url'].toString();

      String date_time = decodeData[j]['start_time'].toString();
      String date = "";
      for (int k = 8; k < 10; k++) {
        date += date_time[k];
      }
      date += '-';
      for (int k = 5; k < 7; k++) {
        date += date_time[k];
      }
      date += '-';
      for (int k = 0; k < 4; k++) {
        date += date_time[k];
      }
      // String time = "";
      // for (int k = 11; k < 16; k++) {
      //   time += date_time[k];
      // }
      String temp = "";
      for (int j = 0; j < 10; j++) {
        temp += date_time[j];
      }
      temp += 'T';
      for (int j = 11; j < 19; j++) {
        temp += date_time[j];
      }
      temp += '.000Z';
      var local_time = DateTime.parse(temp);
      String contestDate = DateFormat.Hm().format(local_time.toLocal());
      String todayDate = DateFormat.Hm().format(presentTime.toLocal());
      if (compare(date, datetime) <= 0) {
        plinks.add(url);
        pduration.add(dura);
        pcontestName.add(name);
        pon.add(date);
        pat.add(DateFormat.Hm().format(local_time.toLocal()));
      } else {
        flinks.add(url);
        fduration.add(dura);
        fcontestName.add(name);
        fon.add(date);
        fat.add(DateFormat.Hm().format(local_time.toLocal()));
      }
    }
    //print(fcontestName);
    //print(fduration);
  }
}
