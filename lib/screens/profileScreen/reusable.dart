// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables
import 'package:flutter/material.dart';

class PlatformCard extends StatefulWidget {
  const PlatformCard(
      {Key key,
      @required this.path,
      @required this.platformName,
      @required this.stringKey,
      @required this.boolKey})
      : super(key: key);
  final String path, platformName, stringKey, boolKey;

  @override
  State<PlatformCard> createState() => _PlatformCardState();
}

class _PlatformCardState extends State<PlatformCard> {
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Container(
        // height: 50,
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
                    Text(
                      widget.platformName,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
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
                  
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
