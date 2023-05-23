import 'package:flutter/material.dart';
import 'package:shoes_app/helpers/helpers.dart';
import 'package:shoes_app/widgets/index.dart';

class ZapatoPage extends StatelessWidget {
  static const String routeName = 'ZapatoPage';

  const ZapatoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    cambiarStatusDark();
    return const Scaffold(
      body: Column(
        children: [
          CUstomAppbar('For you'),
          SizedBox(height: 20),
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  Hero(tag: 'zapato', child: ZapatoSize()),
                  SizedBox(height: 20),
                  ZapatoDesc('Nike Air Max 720',
                      "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so."),
                ],
              ),
            ),
          ),
          AgregarCarritoBoton(100),
        ],
      ),
    );
  }
}
