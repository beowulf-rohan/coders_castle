import 'package:coders_castle/widgets/resuable.dart';
import 'package:flutter/material.dart';
import 'reusable.dart';
import 'package:coders_castle/database/resources_database.dart';

class RoadmapScreen extends StatefulWidget {
  const RoadmapScreen({Key key}) : super(key: key);
  static const String id = 'RoadmapScreen';
  @override
  _RoadmapScreenState createState() => _RoadmapScreenState();
}

class _RoadmapScreenState extends State<RoadmapScreen> {
  @override
  Widget build(BuildContext context) {
    List<PlatformCard> list = [];
    List<Resources> resources = Resources.getResources();
    for (int j = 0; j < resources.length; j++) {
      list.add(PlatformCard(
          playlist: resources[j].playlist,
          topic: resources[j].topic,
          blog: resources[j].blog));
    }
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
                children: list,
              ),
            ),
            SizedBox(height: 30, width: double.infinity)
          ],
        ),
      ),
    );
  }
}
