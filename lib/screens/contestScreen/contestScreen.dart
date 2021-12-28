// ignore_for_file: prefer_const_literals_to_create_immutables, file_names, prefer_const_constructors
import 'package:coders_castle/screens/contestScreen/reusable.dart';
import 'package:coders_castle/widgets/resuable.dart';
import 'package:flutter/material.dart';
import 'package:coders_castle/modals/contests_list.dart';

class ContestScreen extends StatefulWidget {
  const ContestScreen({Key key}) : super(key: key);
  static const String id = 'ContestScreen';
  @override
  _ContestScreenState createState() => _ContestScreenState();
}

class _ContestScreenState extends State<ContestScreen> {
  List<Widget> plist = [];
  List<Widget> flist = [];
  List<SortedList> today = [];
  List<SortedList> upcoming = [];

  @override
  void initState() {
    super.initState();

    //TODAY LIST
    for (int j = 0; j < Codeforces.pat.length; j++) {
      SortedList temp = SortedList();
      temp.duration = Codeforces.pduration[j];
      temp.time = Codeforces.pat[j];
      temp.date = Codeforces.pon[j];
      temp.contestName = Codeforces.pcontestName[j];
      temp.path = 'images/codeforces.png';
      temp.url = Codeforces.plinks[j]; // TODO: add link here
      today.add(temp);
    }

    for (int j = 0; j < CodeChef.pat.length; j++) {
      SortedList temp = SortedList();
      temp.duration = CodeChef.pduration[j];
      temp.time = CodeChef.pat[j];
      temp.date = CodeChef.pon[j];
      temp.contestName = CodeChef.pcontestName[j];
      temp.path = 'images/codechef.png';
      temp.url = CodeChef.plinks[j]; // TODO: add link here
      today.add(temp);
    }

    for (int j = 0; j < AtCoder.pat.length; j++) {
      SortedList temp = SortedList();
      temp.duration = AtCoder.pduration[j];
      temp.time = AtCoder.pat[j];
      temp.date = AtCoder.pon[j];
      temp.contestName = AtCoder.pcontestName[j];
      temp.path = 'images/atcoder.png';
      temp.url = AtCoder.plinks[j]; // TODO: add link here
      today.add(temp);
    }
    for (int j = 0; j < LeetCode.pat.length; j++) {
      SortedList temp = SortedList();
      temp.duration = LeetCode.pduration[j];
      temp.time = LeetCode.pat[j];
      temp.date = LeetCode.pon[j];
      temp.contestName = LeetCode.pcontestName[j];
      temp.path = 'images/leetcode.png';
      temp.url = LeetCode.plinks[j]; // TODO: add link here
      today.add(temp);
    }
    for (int j = 0; j < KickStart.pat.length; j++) {
      SortedList temp = SortedList();
      temp.duration = KickStart.pduration[j];
      temp.time = KickStart.pat[j];
      temp.date = KickStart.pon[j];
      temp.contestName = KickStart.pcontestName[j];
      temp.path = 'images/google.png';
      temp.url = KickStart.plinks[j]; // TODO: add link here
      today.add(temp);
    }

    //UPCOMING LIST
    for (int j = 0; j < Codeforces.fat.length; j++) {
      SortedList temp = SortedList();
      temp.path = 'images/codeforces.png';
      temp.contestName = Codeforces.fcontestName[j];
      temp.date = Codeforces.fon[j];
      temp.time = Codeforces.fat[j];
      temp.duration = Codeforces.fduration[j];
      temp.url = Codeforces.flinks[j]; // TODO: add link here
      upcoming.add(temp);
    }

    for (int j = 0; j < CodeChef.fat.length; j++) {
      SortedList temp = SortedList();
      temp.path = 'images/codechef.png';
      temp.contestName = CodeChef.fcontestName[j];
      temp.date = CodeChef.fon[j];
      temp.time = CodeChef.fat[j];
      temp.duration = CodeChef.fduration[j];
      temp.url = CodeChef.flinks[j]; // TODO: add link here
      upcoming.add(temp);
    }

    for (int j = 0; j < AtCoder.fat.length; j++) {
      SortedList temp = SortedList();
      temp.path = 'images/atcoder.png';
      temp.contestName = AtCoder.fcontestName[j];
      temp.date = AtCoder.fon[j];
      temp.time = AtCoder.fat[j];
      temp.duration = AtCoder.fduration[j];
      temp.url = AtCoder.flinks[j]; // TODO: add link here
      upcoming.add(temp);
    }

    for (int j = 0; j < LeetCode.fat.length; j++) {
      SortedList temp = SortedList();
      temp.path = 'images/leetcode.png';
      temp.contestName = LeetCode.fcontestName[j];
      temp.date = LeetCode.fon[j];
      temp.time = LeetCode.fat[j];
      temp.duration = LeetCode.fduration[j];
      temp.url = LeetCode.flinks[j]; // TODO: add link here
      upcoming.add(temp);
    }

    for (int j = 0; j < KickStart.fat.length; j++) {
      SortedList temp = SortedList();
      temp.path = 'images/google.png';
      temp.contestName = KickStart.fcontestName[j];
      temp.date = KickStart.fon[j];
      temp.time = KickStart.fat[j];
      temp.duration = KickStart.fduration[j];
      temp.url = KickStart.flinks[j]; // TODO: add link here
      upcoming.add(temp);
    }

    upcoming.sort((SortedList a, SortedList b) {
      int year1, year2, month1, month2, day1, day2, hour1, hour2, min1, min2;
      //print(a.date);
      String s = a.date[6] + a.date[7] + a.date[8] + a.date[9];
      year1 = int.parse(s);
      s = b.date[6] + b.date[7] + b.date[8] + b.date[9];
      year2 = int.parse(s);
      s = a.date[3] + a.date[4];
      month1 = int.parse(s);
      s = b.date[3] + b.date[4];
      month2 = int.parse(s);
      s = a.date[0] + a.date[1];
      day1 = int.parse(s);
      s = b.date[0] + b.date[1];
      day2 = int.parse(s);
      s = a.time[0] + a.time[1];
      hour1 = int.parse(s);
      s = b.time[0] + b.time[1];
      hour2 = int.parse(s);
      s = a.time[3] + a.time[4];
      min1 = int.parse(s);
      s = b.time[3] + b.time[4];
      min2 = int.parse(s);

      if (year1 != year2) {
        return year1 - year2;
      }

      if (month1 != month2) {
        return month1 - month2;
      }

      if (day1 != day2) {
        return day1 - day2;
      }

      if (hour1 != hour2) {
        return hour1 - hour2;
      }

      if (min1 != min2) {
        return min1 - min2;
      }

      return 0;
    });

    today.sort((SortedList a, SortedList b) {
      int year1, year2, month1, month2, day1, day2, hour1, hour2, min1, min2;
      //print(a.date);
      String s = a.date[6] + a.date[7] + a.date[8] + a.date[9];
      year1 = int.parse(s);
      s = b.date[6] + b.date[7] + b.date[8] + b.date[9];
      year2 = int.parse(s);
      s = a.date[3] + a.date[4];
      month1 = int.parse(s);
      s = b.date[3] + b.date[4];
      month2 = int.parse(s);
      s = a.date[0] + a.date[1];
      day1 = int.parse(s);
      s = b.date[0] + b.date[1];
      day2 = int.parse(s);
      s = a.time[0] + a.time[1];
      hour1 = int.parse(s);
      s = b.time[0] + b.time[1];
      hour2 = int.parse(s);
      s = a.time[3] + a.time[4];
      min1 = int.parse(s);
      s = b.time[3] + b.time[4];
      min2 = int.parse(s);

      if (year1 != year2) {
        return year1 - year2;
      }

      if (month1 != month2) {
        return month1 - month2;
      }

      if (day1 != day2) {
        return day1 - day2;
      }

      if (hour1 != hour2) {
        return hour1 - hour2;
      }

      if (min1 != min2) {
        return min1 - min2;
      }

      return 0;
    });

    plist.add(HeadingText(text: "Today"));
    for (int j = 0; j < today.length; j++) {
      plist.add(ContestCard(
        path: today[j].path,
        contestName: today[j].contestName,
        date: today[j].date,
        time: today[j].time,
        duration: today[j].duration,
        url: today[j].url,
      ));
    }
    plist.add(SizedBox(height: 10));

    flist.add(HeadingText(text: "Upcoming"));
    for (int j = 0; j < 15 && j < upcoming.length; j++) {
      flist.add(ContestCard(
        path: upcoming[j].path,
        contestName: upcoming[j].contestName,
        date: upcoming[j].date,
        time: upcoming[j].time,
        duration: upcoming[j].duration,
        url: upcoming[j].url,
      ));
    }

    flist.add(SizedBox(height: 10));
  }

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
                children: plist,
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
                children: flist,
              ),
            ),
            SizedBox(height: 30, width: double.infinity)
          ],
        ),
      ),
    );
  }
}

class SortedList {
  String path;
  String contestName;
  String date;
  String time;
  String duration;
  String url;
}
