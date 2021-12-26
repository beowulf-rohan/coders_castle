// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';

class PlatformCard extends StatefulWidget {
  PlatformCard({this.topic, this.playlist, this.blog});
  String blog, playlist, topic;
  @override
  State<PlatformCard> createState() => _PlatformCardState();
}

void launchURL(linkURL) {
  // print(url);
  FlutterWebBrowser.openWebPage(
    url: linkURL,
    customTabsOptions: const CustomTabsOptions(
      colorScheme: CustomTabsColorScheme.dark,
      toolbarColor: Colors.black45,
      shareState: CustomTabsShareState.on,
      instantAppsEnabled: true,
      showTitle: true,
      urlBarHidingEnabled: true,
    ),
    safariVCOptions: const SafariViewControllerOptions(
      barCollapsingEnabled: true,
      preferredBarTintColor: Colors.black,
      preferredControlTintColor: Colors.black,
      dismissButtonStyle: SafariViewControllerDismissButtonStyle.close,
      modalPresentationCapturesStatusBarAppearance: true,
    ),
  );
}

class _PlatformCardState extends State<PlatformCard> {
  bool isVisible = false;
  String username = "";

  @override
  void initState() {
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            widget.topic,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      launchURL(widget.playlist);
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
                            'Playlist',
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.9),
                                fontSize: 20,
                                fontWeight: FontWeight.w800),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      launchURL(widget.blog);
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
                            'Blog',
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.9),
                                fontSize: 20,
                                fontWeight: FontWeight.w800),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
