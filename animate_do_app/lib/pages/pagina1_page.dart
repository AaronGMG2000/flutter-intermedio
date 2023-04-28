import 'package:animate_do/animate_do.dart';
import 'package:animate_do_app/pages/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Pagina1Page extends StatelessWidget {
  static const String routeName = 'Pagina1Page';

  const Pagina1Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FadeIn(child: const Text('Animate_do')),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, CupertinoPageRoute(builder: (context) => const TwitterPage()));
            },
            icon: const FaIcon(FontAwesomeIcons.twitter),
          ),
          SlideInLeft(
            from: 100,
            child: IconButton(
              onPressed: () {
                Navigator.push(context, CupertinoPageRoute(builder: (context) => const Pagina1Page()));
              },
              icon: const Icon(Icons.navigate_next),
            ),
          ),
        ],
      ),
      floatingActionButton: ElasticInRight(
        child: const FloatingActionButton(
          onPressed: null,
          child: FaIcon(FontAwesomeIcons.play),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElasticIn(
                delay: const Duration(milliseconds: 1100),
                child: const Icon(Icons.new_releases, color: Colors.blue, size: 40)),
            FadeInDown(
              delay: const Duration(milliseconds: 200),
              child: const Text('Title', style: TextStyle(fontSize: 40, fontWeight: FontWeight.w200)),
            ),
            FadeInDown(
              delay: const Duration(milliseconds: 800),
              child: const Text('I am a text small', style: TextStyle(fontSize: 20)),
            ),
            FadeInLeft(
              delay: const Duration(milliseconds: 1100),
              child: Container(
                width: 220,
                height: 2,
                color: Colors.blue,
              ),
            )
          ],
        ),
      ),
    );
  }
}
