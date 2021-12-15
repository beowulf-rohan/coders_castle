import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

class GlassBackground extends StatefulWidget {
  const GlassBackground({Key key, @required this.childWidget})
      : super(key: key);
  final Widget childWidget;
  @override
  _GlassBackgroundState createState() => _GlassBackgroundState();
}

class _GlassBackgroundState extends State<GlassBackground> {


  @override
  Widget build(BuildContext context) {
    return GlassmorphicContainer(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      border: 1.0,
      borderRadius: 15,
      blur: 10,
      linearGradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Colors.white.withOpacity(0.0),
          // Colors.white.withOpacity(0.01),
          // Colors.white.withOpacity(0.02),
          // Colors.white.withOpacity(0.03),
          // Colors.white.withOpacity(0.04),
          Colors.white.withOpacity(0.05),
          // Colors.white.withOpacity(0.06),
          // Colors.white.withOpacity(0.07),
          // Colors.white.withOpacity(0.08),
          // Colors.white.withOpacity(0.09),
          Colors.white.withOpacity(0.1),
        ],
      ),
      borderGradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Colors.white.withOpacity(0.2), Colors.white.withOpacity(0.2)],
      ),
      child: widget.childWidget,
    );
  }
}
