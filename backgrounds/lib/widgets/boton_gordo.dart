import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BotonGordo extends StatelessWidget {
  final IconData icon;
  final String texto;
  final Color color1;
  final Color color2;
  final VoidCallback? onPress;

  const BotonGordo({
    Key? key,
    required this.icon,
    required this.texto,
    this.color1 = const Color(0xff6989f5),
    this.color2 = const Color(0xff906ef5),
    this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      behavior: HitTestBehavior.translucent,
      child: Stack(
        children: [
          _BotonGordoBackground(color1, color2, icon),
          Row(
            children: [
              const SizedBox(height: 140, width: 40),
              FaIcon(icon, color: Colors.white, size: 40),
              const SizedBox(width: 20),
              Expanded(
                child: Text(texto,
                    style: const TextStyle(color: Colors.white, fontSize: 18)),
              ),
              const FaIcon(FontAwesomeIcons.chevronRight, color: Colors.white),
              const SizedBox(width: 40),
            ],
          ),
        ],
      ),
    );
  }
}

class _BotonGordoBackground extends StatelessWidget {
  final Color color1;
  final Color color2;
  final IconData icon;
  const _BotonGordoBackground(this.color1, this.color2, this.icon, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: const Offset(4, 6),
            blurRadius: 10,
          ),
        ],
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(colors: [color1, color2]),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: [
            Positioned(
              right: -20,
              top: -20,
              child:
                  FaIcon(icon, size: 150, color: Colors.white.withOpacity(0.2)),
            )
          ],
        ),
      ),
    );
  }
}
