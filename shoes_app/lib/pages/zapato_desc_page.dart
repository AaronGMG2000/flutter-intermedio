import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_app/helpers/helpers.dart';
import 'package:shoes_app/models/zapato_model.dart';
import 'package:shoes_app/widgets/index.dart';

class ZapatoDescPage extends StatelessWidget {
  static const String routeName = 'ZapatoDescPage';

  const ZapatoDescPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    cambiarStatusLight();
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              const Hero(tag: 'zapato', child: ZapatoSize(fullScreen: true)),
              Positioned(
                top: 80,
                child: FloatingActionButton(
                  onPressed: () {
                    cambiarStatusDark();
                    Navigator.pop(context);
                  },
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  highlightElevation: 0,
                  child: const Icon(Icons.chevron_left, color: Colors.white, size: 60),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  ZapatoDesc('Nike Air Max 720',
                      "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so."),
                  _MontoBuyNow(),
                  _ColoresYmas(),
                  _BotonesLikeCartSettings()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BotonesLikeCartSettings extends StatelessWidget {
  const _BotonesLikeCartSettings();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const _BotonSombreado(Icon(Icons.star, color: Colors.red, size: 25)),
          _BotonSombreado(Icon(Icons.add_shopping_cart, color: Colors.grey.withOpacity(0.4), size: 25)),
          _BotonSombreado(Icon(Icons.settings, color: Colors.grey.withOpacity(0.4), size: 25)),
        ],
      ),
    );
  }
}

class _BotonSombreado extends StatelessWidget {
  final Icon icon;
  const _BotonSombreado(this.icon, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45,
      height: 45,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(color: Colors.black12, spreadRadius: -5, blurRadius: 20, offset: Offset(0, 10)),
        ],
      ),
      child: icon,
    );
  }
}

class _ColoresYmas extends StatelessWidget {
  const _ColoresYmas();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned(left: 90, child: _Color(Color(0xffC6D642), 4, 'verde.png')),
                Positioned(left: 60, child: _Color(Color(0xffFFAD29), 3, 'amarillo.png')),
                Positioned(left: 30, child: _Color(Color(0xff2099F1), 2, 'azul.png')),
                _Color(Color(0xff364D56), 1, 'negro.png'),
              ],
            ),
          ),
          BotonNaranja('More related items', alto: 30, ancho: 170),
        ],
      ),
    );
  }
}

class _Color extends StatelessWidget {
  final Color color;
  final int index;
  final String image;
  const _Color(this.color, this.index, this.image, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final zapatoModel = Provider.of<ZapatoModel>(context);
    return FadeInLeft(
      delay: Duration(milliseconds: index * 100),
      duration: const Duration(milliseconds: 300),
      child: Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () => zapatoModel.assetImage = 'assets/$image',
            splashColor: Colors.white.withOpacity(0.3),
            borderRadius: BorderRadius.circular(100),
          ),
        ),
      ),
    );
  }
}

class _MontoBuyNow extends StatelessWidget {
  const _MontoBuyNow();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: [
          const Text(
            '\$180.0',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          Bounce(
            from: 8,
            delay: const Duration(milliseconds: 1000),
            child: const BotonNaranja('Buy Now', alto: 40, ancho: 120),
          ),
        ],
      ),
    );
  }
}
