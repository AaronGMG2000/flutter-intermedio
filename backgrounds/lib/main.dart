// import 'package:backgrounds/pages/animations_page.dart';
// import 'package:backgrounds/labs/ciruclar_progress_page.dart';
// import 'package:backgrounds/pages/graficas_circulares_page.dart';
// import 'package:backgrounds/labs/slideshow_lab_page.dart';
// import 'package:backgrounds/pages/slideshow_page.dart';
// import 'package:backgrounds/pages/pinteres_page.dart';
// import 'package:backgrounds/pages/emergency_page.dart';
import 'package:backgrounds/pages/slider_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: SliderPage(),
    );
  }
}
