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

  @override
  void initState() {
    super.initState();
    plist.add(HeadingText(text: "Today"));

    for (int j = 0; j < Codeforces.pat.length; j++) {
      plist.add(ContestCard(
        path: 'images/codeforces.png',
        contestName: Codeforces.pcontestName[j],
        date: Codeforces.pon[j],
        time: Codeforces.pat[j],
        duration: Codeforces.pduration[j],
      ));
    }

    for (int j = 0; j < CodeChef.pat.length; j++) {
      plist.add(ContestCard(
        path: 'images/codechef.png',
        contestName: CodeChef.pcontestName[j],
        date: CodeChef.pon[j],
        time: CodeChef.pat[j],
        duration: CodeChef.pduration[j],
      ));
    }

    for (int j = 0; j < AtCoder.pat.length; j++) {
      plist.add(ContestCard(
        path: 'images/atcoder.png',
        contestName: AtCoder.pcontestName[j],
        date: AtCoder.pon[j],
        time: AtCoder.pat[j],
        duration: AtCoder.pduration[j],
      ));
    }
    for (int j = 0; j < LeetCode.pat.length; j++) {
      plist.add(ContestCard(
        path: 'images/leetcode.png',
        contestName: LeetCode.pcontestName[j],
        date: LeetCode.pon[j],
        time: LeetCode.pat[j],
        duration: LeetCode.pduration[j],
      ));
    }
    for (int j = 0; j < KickStart.pat.length; j++) {
      plist.add(ContestCard(
        path: 'images/google.png',
        contestName: KickStart.pcontestName[j],
        date: KickStart.pon[j],
        time: KickStart.pat[j],
        duration: KickStart.pduration[j],
      ));
    }
    plist.add(SizedBox(height: 10));

    flist.add(HeadingText(text: "Upcoming"));
    for (int j = 0; j < 3 && j < Codeforces.fat.length; j++) {
      flist.add(ContestCard(
        path: 'images/codeforces.png',
        contestName: Codeforces.fcontestName[j],
        date: Codeforces.fon[j],
        time: Codeforces.fat[j],
        duration: Codeforces.fduration[j],
      ));
    }

    for (int j = 0; j < 3 && j < CodeChef.fat.length; j++) {
      flist.add(ContestCard(
        path: 'images/codechef.png',
        contestName: CodeChef.fcontestName[j],
        date: CodeChef.fon[j],
        time: CodeChef.fat[j],
        duration: CodeChef.fduration[j],
      ));
    }

    for (int j = 0; j < 3 && j < AtCoder.fat.length; j++) {
      flist.add(ContestCard(
        path: 'images/atcoder.png',
        contestName: AtCoder.fcontestName[j],
        date: AtCoder.fon[j],
        time: AtCoder.fat[j],
        duration: AtCoder.fduration[j],
      ));
    }

    for (int j = 0; j < 3 && j < LeetCode.fat.length; j++) {
      flist.add(ContestCard(
        path: 'images/leetcode.png',
        contestName: LeetCode.fcontestName[j],
        date: LeetCode.fon[j],
        time: LeetCode.fat[j],
        duration: LeetCode.fduration[j],
      ));
    }

    for (int j = 0; j < 3 && j < KickStart.fat.length; j++) {
      flist.add(ContestCard(
        path: 'images/google.png',
        contestName: KickStart.fcontestName[j],
        date: KickStart.fon[j],
        time: KickStart.fat[j],
        duration: KickStart.fduration[j],
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
