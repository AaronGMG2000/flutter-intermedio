import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IconHeader extends StatelessWidget {
  final IconData icon;
  final String titutlo;
  final String subtitulo;
  final Color color1;
  final Color color2;
  const IconHeader({
    Key? key,
    required this.icon,
    required this.titutlo,
    required this.subtitulo,
    this.color1 = const Color(0xff526BF6),
    this.color2 = const Color(0xff67ACF2),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color colorBlanco = Colors.white.withOpacity(0.7);
    return Stack(
      children: [
        _IconHeaderBackground(color1: color1, color2: color2),
        Positioned(
          top: -50,
          left: -70,
          child: FaIcon(icon, size: 250, color: Colors.white.withOpacity(0.2)),
        ),
        Column(
          children: [
            const SizedBox(
              height: 80,
              width: double.infinity,
            ),
            Text(titutlo, style: TextStyle(fontSize: 20, color: colorBlanco)),
            const SizedBox(height: 20),
            Text(
              subtitulo,
              style: TextStyle(
                fontSize: 25,
                color: colorBlanco,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            FaIcon(icon, size: 80, color: Colors.white.withOpacity(0.2)),
          ],
        )
      ],
    );
  }
}

class _IconHeaderBackground extends StatelessWidget {
  final Color color1;
  final Color color2;
  const _IconHeaderBackground(
      {Key? key, required this.color1, required this.color2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xff526BF6), Color(0xff67ACF2)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(100),
        ),
      ),
    );
  }
}
