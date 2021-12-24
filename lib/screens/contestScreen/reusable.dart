// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';
// import 'package:url_launcher/url_launcher.dart';

class ContestContainer extends StatefulWidget {
  const ContestContainer({Key key, @required this.childWidget}) : super(key: key);
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
      decoration:
          BoxDecoration(color: Color(0xff2a2a2a).withOpacity(0.5), borderRadius: BorderRadius.circular(15)),
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
      @required this.duration,
      @required this.url})
      : super(key: key);
  final String path, contestName, date, time, duration, url;

  // Future<void> launchURL(String url) async {
  //   if (await canLaunch(url)) {
  //     await launch(
  //       url,
  //       // forceSafariVC: true,
  //       // forceWebView: true,
  //       // enableJavaScript: true,
  //     );
  //   }
  // }

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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        launchURL(url);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
        child: Container(
          // height: 90,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.1),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 3, bottom: 3),
                child: SizedBox(
                  height: 70,
                  width: 50,
                  child: Image.asset(path),
                ),
              ),
              VerticalDivider(
                indent: 10,
                endIndent: 10,
                color: Colors.white.withOpacity(0.5),
                thickness: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    SingleChildScrollView(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.52,
                        child: Text(
                          contestName,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 7.5),
                    Row(
                      children: [
                        Text(
                          'On : ',
                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.white),
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
                          'At : ',
                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.white),
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
                      children: [
                        Text(
                          'Duration : ',
                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.white),
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
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
