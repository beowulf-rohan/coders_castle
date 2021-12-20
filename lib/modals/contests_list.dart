import 'dart:convert';
import 'package:coders_castle/data_fetching/networking.dart';
import 'package:intl/intl.dart';

class FormattedTime {
  String formatedTime(int secTime) {
    String getParsedTime(String time) {
      if (time.length <= 1) return "0$time";
      return time;
    }

    int min = secTime ~/ 60;
    int sec = secTime % 60;

    String parsedTime =
        getParsedTime(min.toString()) + ":" + getParsedTime(sec.toString());

    return parsedTime;
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

  void getContestInfo() async {
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
      int dur = int.parse(sam);
      var d2 = Duration(seconds: dur);
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
      String time = "";
      for (int k = 11; k < 16; k++) {
        time += date_time[k];
      }
      var local_time = DateTime.parse(date_time);
      //print(date);
      if (date.compareTo(datetime) == 0) {
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
    print(fcontestName);
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

  void getContestInfo() async {
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
      var d2 = Duration(seconds: dur);
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
      String time = "";
      for (int k = 11; k < 16; k++) {
        time += date_time[k];
      }
      var local_time = DateTime.parse(date_time);
      //print(date);
      if (date.compareTo(datetime) == 0) {
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
    print(fcontestName);
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

  void getContestInfo() async {
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
      var d2 = Duration(seconds: dur);
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
      String time = "";
      for (int k = 11; k < 16; k++) {
        time += date_time[k];
      }
      var local_time = DateTime.parse(date_time);
      //print(date);
      if (date.compareTo(datetime) == 0) {
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
    print(fcontestName);
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

  void getContestInfo() async {
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
      var d2 = Duration(seconds: dur);
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
      String time = "";
      for (int k = 11; k < 16; k++) {
        time += date_time[k];
      }
      var local_time = DateTime.parse(date_time);
      //print(date);
      if (date.compareTo(datetime) == 0) {
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
    print(fcontestName);
    //print(fduration);
  }
}
