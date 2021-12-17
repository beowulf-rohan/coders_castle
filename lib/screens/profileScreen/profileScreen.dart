// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:coders_castle/screens/profileScreen/reusable.dart';
import 'package:coders_castle/widgets/resuable.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key key}) : super(key: key);
  static const String id = 'ProfileScreen';
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return GlassBackground(
      childWidget: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.only(top: 30),
              decoration: BoxDecoration(
                color: Color(0xff2a2a2a).withOpacity(0.2),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PlatformCard(
                    path: 'images/leetcode.png',
                    platformName: 'Leetcode',
                    stringKey: 'leetocode',
                    boolKey: 'bool_leetcode',
                  ),
                  PlatformCard(
                    path: 'images/codechef.png',
                    platformName: 'Codechef',
                    stringKey: 'codechef',
                    boolKey: 'bool_codechef',
                  ),
                  PlatformCard(
                    path: 'images/codeforces.png',
                    platformName: 'Codeforces',
                    stringKey: 'codeforces',
                    boolKey: 'bool_codeforces',
                  ),
                  PlatformCard(
                    path: 'images/atcoder.png',
                    platformName: 'AtCoder',
                    stringKey: 'atcoder',
                    boolKey: 'bool_atcoder',
                  ),
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
