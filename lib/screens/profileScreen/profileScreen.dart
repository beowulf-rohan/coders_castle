// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:coders_castle/progress_indicator/progressIndicator.dart';
import 'package:coders_castle/screens/profileScreen/reusable.dart';
import 'package:coders_castle/widgets/resuable.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key key}) : super(key: key);
  static const String id = 'ProfileScreen';
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: Provider.of<ProgressIndicatorChange>(context).codechef | Provider.of<ProgressIndicatorChange>(context).codeforces | Provider.of<ProgressIndicatorChange>(context).leetcode | Provider.of<ProgressIndicatorChange>(context).atcoder,
      child: GlassBackground(
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
                      path: 'images/codechef.png',
                      platformName: 'Codechef',
                      stringKey: 'codechef',
                    ),
                    PlatformCard(
                      path: 'images/codeforces.png',
                      platformName: 'Codeforces',
                      stringKey: 'codeforces',
                    ),
                    PlatformCard(
                      path: 'images/leetcode.png',
                      platformName: 'Leetcode',
                      stringKey: 'leetcode',
                    ),
                    PlatformCard(
                      path: 'images/atcoder.png',
                      platformName: 'AtCoder',
                      stringKey: 'atcoder',
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30, width: double.infinity)
            ],
          ),
        ),
      ),
    );
  }
}
