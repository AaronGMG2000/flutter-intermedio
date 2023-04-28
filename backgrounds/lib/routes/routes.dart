import 'package:backgrounds/pages/animations_page.dart';
import 'package:backgrounds/pages/emergency_page.dart';
import 'package:backgrounds/pages/graficas_circulares_page.dart';
import 'package:backgrounds/pages/headers_page.dart';
import 'package:backgrounds/pages/pinteres_page.dart';
import 'package:backgrounds/pages/slider_page.dart';
import 'package:backgrounds/pages/slideshow_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final pageRoutes = <_Route>[
  const _Route(FontAwesomeIcons.slideshare, 'Slideshow', SlideshowPage()),
  const _Route(FontAwesomeIcons.truckMedical, 'Emergencia', EmergencyPage()),
  const _Route(FontAwesomeIcons.heading, 'Encabezados', HeadersPage()),
  const _Route(FontAwesomeIcons.peopleCarryBox, 'Cuadro Animado', CuadradoAnimado()),
  const _Route(FontAwesomeIcons.circleNotch, 'Barra Progreso', GraficasCircularPage()),
  const _Route(FontAwesomeIcons.pinterest, 'Pinterest', PinteresPage()),
  const _Route(FontAwesomeIcons.mobile, 'Slivers', SliderPage()),
];

class _Route {
  final IconData icon;
  final String title;
  final Widget page;

  const _Route(this.icon, this.title, this.page);
}
