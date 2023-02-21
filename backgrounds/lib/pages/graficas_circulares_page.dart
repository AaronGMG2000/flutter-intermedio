import 'package:backgrounds/widgets/radial_progress.dart';
import 'package:flutter/material.dart';

class GraficasCircularPage extends StatefulWidget {
  const GraficasCircularPage({Key? key}) : super(key: key);

  @override
  State<GraficasCircularPage> createState() => _GraficasCircularPageState();
}

class _GraficasCircularPageState extends State<GraficasCircularPage> {
  double porcentaje = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.refresh),
        onPressed: () {
          setState(() {
            porcentaje += 10;
            if (porcentaje > 100) {
              porcentaje = 0;
            }
          });
        },
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              _CustomRadialProgress(
                  porcentaje, Colors.blue, Colors.grey, 10, 4),
              _CustomRadialProgress(
                  porcentaje, Colors.amber, Colors.grey, 10, 4),
            ],
          ),
          Row(
            children: [
              _CustomRadialProgress(
                  porcentaje, Colors.indigo, Colors.grey, 10, 4),
              _CustomRadialProgress(
                  porcentaje, Colors.orange, Colors.grey, 10, 4),
            ],
          ),
        ],
      ),
    );
  }
}

class _CustomRadialProgress extends StatelessWidget {
  const _CustomRadialProgress(
    this.porcentaje,
    this.colorPrimario,
    this.colorSecundario,
    this.grosorPrimario,
    this.grosorSecundario,
  );

  final double porcentaje;
  final Color colorPrimario;
  final Color colorSecundario;
  final double grosorPrimario;
  final double grosorSecundario;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      height: 180,
      child: RadialProgress(
        porcentaje: porcentaje,
        colorPrimario: colorPrimario,
        colorSecundario: colorSecundario,
        grosorPrimario: grosorPrimario,
        grosorSecundario: grosorSecundario,
      ),
    );
  }
}
