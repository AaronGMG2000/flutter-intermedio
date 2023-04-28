import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TwitterPage extends StatefulWidget {
  static const String routeName = 'TwitterPage';

  const TwitterPage({Key? key}) : super(key: key);

  @override
  State<TwitterPage> createState() => _TwitterPageState();
}

class _TwitterPageState extends State<TwitterPage> {
  bool _animate = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink,
        onPressed: () => setState(() => _animate = !_animate),
        child: const FaIcon(FontAwesomeIcons.play),
      ),
      backgroundColor: const Color(0xff1DA1F2),
      body: Center(
        child: ZoomOut(
          animate: _animate,
          duration: const Duration(milliseconds: 1000),
          from: 30,
          child: const FaIcon(FontAwesomeIcons.twitter, color: Colors.white, size: 40),
        ),
      ),
    );
  }
}
