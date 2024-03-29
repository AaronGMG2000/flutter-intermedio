// import 'package:backgrounds/pages/animations_page.dart';
// import 'package:backgrounds/labs/ciruclar_progress_page.dart';
// import 'package:backgrounds/pages/graficas_circulares_page.dart';
// import 'package:backgrounds/labs/slideshow_lab_page.dart';
// import 'package:backgrounds/pages/slideshow_page.dart';
// import 'package:backgrounds/pages/pinteres_page.dart';
// import 'package:backgrounds/pages/emergency_page.dart';
import 'package:backgrounds/models/layout_model.dart';
import 'package:backgrounds/pages/launcher_page.dart';
import 'package:backgrounds/pages/launcher_page_tablet.dart';
import 'package:backgrounds/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => ThemeChanger(2)),
          ChangeNotifierProvider(create: (context) => LayoutModel()),
        ],
        child: const MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChanger>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      theme: themeChanger.currentTheme,
      home: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          final screenSize = MediaQuery.of(context).size;
          if (screenSize.width > 500) {
            return const LauncherPageTablet();
          } else {
            return const LauncherPage();
          }
        },
      ),
    );
  }
}
