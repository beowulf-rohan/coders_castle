// ignore_for_file: prefer_const_constructors
import 'package:coders_castle/widgets/resuable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContestContainer extends StatefulWidget {
  const ContestContainer({Key key, @required this.childWidget})
      : super(key: key);
  final Widget childWidget;

  @override
  _ContestContainerState createState() => _ContestContainerState();
}

class _ContestContainerState extends State<ContestContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      height: 400,
      decoration: BoxDecoration(
          color: Color(0xff2a2a2a).withOpacity(0.5),
          borderRadius: BorderRadius.circular(15)),
      child: widget.childWidget,
    );
  }
}

class HeadingText extends StatelessWidget {
  const HeadingText({Key key, @required this.text}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 20),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 28,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class ContestCard extends StatelessWidget {
  const ContestCard(
      {Key key,
      @required this.path,
      @required this.contestName,
      @required this.date,
      @required this.time,
      @required this.duration})
      : super(key: key);
  final String path, contestName, date, time, duration;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.1),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 7.5, top: 3, bottom: 3),
              child: SizedBox(
                height: 70,
                width: 50,
                child: Image.asset('images/codechef.png'),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: Divider(
                indent: 20,
                endIndent: 20,
                color: Colors.white,
                height: 15,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 10),
                  Text(
                    'username',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 7.5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Max Rating : ',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                      Text(
                        date,
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.white.withOpacity(0.5)),
                      ),
                      SizedBox(width: 30),
                      Text(
                        'Current Rating : ',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                      Text(
                        time,
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.white.withOpacity(0.5)),
                      )
                    ],
                  ),
                  SizedBox(height: 7.5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Designation : ',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                      Text(
                        duration,
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.white.withOpacity(0.5)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
