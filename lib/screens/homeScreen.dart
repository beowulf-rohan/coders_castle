// ignore_for_file: file_names, prefer_const_constructors
import 'package:coders_castle/screens/contestScreen/contestScreen.dart';
import 'package:coders_castle/screens/profileScreen/profileScreen.dart';
import 'package:coders_castle/screens/statsScreen/statsScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);
  static const String id = 'HomeScreen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    ContestScreen(),
    StatsScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.black,
            boxShadow: [
              BoxShadow(
                blurRadius: 20,
                color: Colors.black.withOpacity(.1),
              )
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: Colors.white,
              hoverColor: Colors.white,
              gap: 8,
// backgroundColor: Colors.white, // activeColor: Colors.black,
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 22.5, vertical: 12),
              duration: Duration(milliseconds: 500),
              tabBackgroundColor: Color(0xff2a2a2a),
              color: Colors.white,
              tabs: const [
                GButton(
                  icon: LineIcons.calendar,
                  haptic: true,
                  text: 'Contests',
                  textStyle: TextStyle(color: Colors.white),
                  backgroundColor: Color(0xff2a2a2a),
                  iconActiveColor: Colors.white,
                ),
                GButton(
                  icon: LineIcons.chalkboard,
                  haptic: true,
                  text: 'Stats',
                  textStyle: TextStyle(color: Colors.white),
                  backgroundColor: Color(0xff2a2a2a),
                  iconActiveColor: Colors.white,
                ),
                GButton(
                  icon: LineIcons.user,
                  haptic: true,
                  text: 'Profile',
                  textStyle: TextStyle(color: Colors.white),
                  backgroundColor: Color(0xff2a2a2a),
                  iconActiveColor: Colors.white,
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
