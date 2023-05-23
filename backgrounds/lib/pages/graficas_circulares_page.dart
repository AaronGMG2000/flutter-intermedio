import 'package:backgrounds/theme/theme.dart';
import 'package:backgrounds/widgets/radial_progress.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _CustomRadialProgress(porcentaje, Colors.blue, Colors.grey, 10, 4),
              _CustomRadialProgress(porcentaje * 1.2, Colors.amber, Colors.grey, 10, 4),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _CustomRadialProgress(porcentaje * 1.4, Colors.indigo, Colors.grey, 10, 4),
              _CustomRadialProgress(porcentaje * 1.6, Colors.orange, Colors.grey, 10, 4),
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
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;
    return SizedBox(
      width: 180,
      height: 180,
      child: RadialProgress(
        porcentaje: porcentaje,
        colorPrimario: colorPrimario,
        colorSecundario: appTheme.textTheme.bodyLarge!.color!,
        grosorPrimario: grosorPrimario,
        grosorSecundario: grosorSecundario,
      ),
    );
  }
}
