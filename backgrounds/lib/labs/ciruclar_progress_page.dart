import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class CiruclarProgressPage extends StatefulWidget {
  const CiruclarProgressPage({Key? key}) : super(key: key);

  @override
  State<CiruclarProgressPage> createState() => _CiruclarProgressPageState();
}

class _CiruclarProgressPageState extends State<CiruclarProgressPage>
    with SingleTickerProviderStateMixin {
  double porcentaje = 10.0;
  AnimationController? controller;
  double nuevoPorcentaje = 0.0;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    controller?.addListener(() {
      setState(() {
        porcentaje =
            lerpDouble(porcentaje, nuevoPorcentaje, controller!.value)!;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.refresh),
        onPressed: () {
          setState(() {
            porcentaje = nuevoPorcentaje;
            nuevoPorcentaje += 10;
            if (nuevoPorcentaje > 100) {
              nuevoPorcentaje = 0;
              porcentaje = 0;
            }
            controller?.forward(from: 0.0);
          });
        },
      ),
      body: Center(
        child: SizedBox(
          width: 300,
          height: 300,
          child: CustomPaint(
            painter: _MiRadialProgress(porcentaje),
          ),
        ),
      ),
    );
  }
}

class _MiRadialProgress extends CustomPainter {
  final double porcentaje;
  _MiRadialProgress(this.porcentaje);
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = 4
      ..color = Colors.grey
      ..style = PaintingStyle.stroke;
    final Offset center = Offset(size.width * 0.5, size.height * 0.5);
    final double radius = min(size.width * 0.5, size.height * 0.5);
    canvas.drawCircle(center, radius, paint);

    final paintArco = Paint()
      ..strokeWidth = 10
      ..color = Colors.pink
      ..style = PaintingStyle.stroke;

    // Parte que se deberá ir llenando
    double arcAngle = 2 * pi * (porcentaje / 100);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      arcAngle,
      false,
      paintArco,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
