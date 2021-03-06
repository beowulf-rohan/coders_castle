// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:coders_castle/modals/stats_list.dart' as stats;
import 'package:coders_castle/progress_indicator/progressIndicator.dart';
import 'package:provider/provider.dart';
import 'package:alert/alert.dart';

class PlatformCard extends StatefulWidget {
  const PlatformCard(
      {Key key,
      @required this.path,
      @required this.platformName,
      @required this.stringKey})
      : super(key: key);
  final String path, platformName, stringKey;

  @override
  State<PlatformCard> createState() => _PlatformCardState();
}

class _PlatformCardState extends State<PlatformCard> {
  bool isVisible = false;
  String username = "";

  Future getUserName() async {
    final SharedPreferences sharedPref = await SharedPreferences.getInstance();
    String name = sharedPref.getString(widget.stringKey);
    setState(() {
      username = (name == null) ? "" : name;
    });
  }

  Future updateChanges() async {
    final SharedPreferences sharedPref = await SharedPreferences.getInstance();
    sharedPref.setString(widget.stringKey, username);

    Provider.of<ProgressIndicatorChange>(context, listen: false)
        .changeSpinnerState(widget.stringKey);

    if (widget.stringKey.compareTo('leetcode') == 0) {
      await stats.LeetCodePerformance().getPerformanceInfo(username);
    } else if (widget.stringKey.compareTo('atcoder') == 0) {
      await stats.AtcoderPerformance().getPerformanceInfo(username);
    } else if (widget.stringKey.compareTo('codeforces') == 0) {
      await stats.CodeforcesPerformance().getPerformanceInfo(username);
    } else if (widget.stringKey.compareTo('codechef') == 0) {
      await stats.CodeChefPerformance().getPerformanceInfo(username);
    }

    setState(() {
      isVisible = false;
    });

    Provider.of<ProgressIndicatorChange>(context, listen: false)
        .changeSpinnerState(widget.stringKey);

    bool validUsername = true;
    if (stats.CodeChefPerformance.status.compareTo('Failed') == 0 &&
        widget.stringKey.compareTo('codechef') == 0) {
      Alert(message: 'Please enter a valid username', shortDuration: true)
          .show();
      setState(() {
        validUsername = false;
      });
    } else if (stats.CodeforcesPerformance.status.compareTo('Failed') == 0 &&
        widget.stringKey.compareTo('codeforces') == 0) {
      Alert(message: 'Please enter a valid username', shortDuration: true)
          .show();
      setState(() {
        validUsername = false;
      });
    } else if (stats.LeetCodePerformance.status.compareTo('Failed') == 0 &&
        widget.stringKey.compareTo('leetcode') == 0) {
      Alert(message: 'Please enter a valid username', shortDuration: true)
          .show();
      setState(() {
        validUsername = false;
      });
    } else if (stats.AtcoderPerformance.status.compareTo('Failed') == 0 &&
        widget.stringKey.compareTo('atcoder') == 0) {
      Alert(message: 'Please enter a valid username', shortDuration: true)
          .show();
      setState(() {
        validUsername = false;
      });
    } else {
      Alert(message: 'Username verified and added', shortDuration: true).show();
    }

    // if (validUsername) {
    //   final SharedPreferences sharedPref =
    //       await SharedPreferences.getInstance();
    //   sharedPref.setString(widget.stringKey, username);
    // }
  }

  @override
  void initState() {
    getUserName().whenComplete(() => {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.1),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 7.5, top: 3, bottom: 3),
                      child: SizedBox(
                        height: 40,
                        width: 30,
                        child: Image.asset(widget.path),
                      ),
                    ),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.platformName,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: 'Fredoka',
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                        Text(
                          'username : $username',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.7),
                            fontSize: 15,
                            fontWeight: FontWeight.w100,
                            fontFamily: 'Fredoka',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isVisible = !isVisible;
                      });
                    },
                    child: Icon(
                      (isVisible)
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            Visibility(
              visible: isVisible,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: TextField(
                      onChanged: (value) {
                        username = value;
                      },
                      controller: TextEditingController(text: username),
                      // cursorColor: primaryColour,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.7),
                      ),
                      decoration: InputDecoration(
                        labelText: "username",
                        labelStyle: TextStyle(
                          fontFamily: 'Fredoka',
                          fontWeight: FontWeight.w100,
                          color: Colors.white.withOpacity(0.9),
                        ),
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.w100,
                          color: Colors.white.withOpacity(0.7),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white.withOpacity(0.8)),
                        ),
                        hintText: "Enter your username",
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (username != null) {
                        updateChanges();
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 40,
                        width: 100,
                        decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.65),
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Text(
                            'update',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.9),
                              fontSize: 20,
                              fontFamily: 'Fredoka',
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
