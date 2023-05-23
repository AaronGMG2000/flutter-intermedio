import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_app/models/zapato_model.dart';
import 'package:shoes_app/pages/zapato_desc_page.dart';

class ZapatoSize extends StatelessWidget {
  final bool fullScreen;
  const ZapatoSize({Key? key, this.fullScreen = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!fullScreen) {
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const ZapatoDescPage()));
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: fullScreen ? 0 : 30,
          vertical: fullScreen ? 0 : 5,
        ),
        child: Container(
          width: double.infinity,
          height: fullScreen ? 410 : 430,
          decoration: BoxDecoration(
            color: const Color(0xffFFCF53),
            borderRadius: fullScreen
                ? const BorderRadius.only(bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50))
                : const BorderRadius.all(Radius.circular(50)),
          ),
          child: Column(
            children: [
              const _ZapatoConSombra(),
              if (!fullScreen) const _ZapatoTallas(),
            ],
          ),
        ),
      ),
    );
  }
}

class _ZapatoTallas extends StatelessWidget {
  const _ZapatoTallas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _TallaZapatoCaja(7),
          _TallaZapatoCaja(7.5),
          _TallaZapatoCaja(8),
          _TallaZapatoCaja(8.5),
          _TallaZapatoCaja(9),
          _TallaZapatoCaja(9.5),
        ],
      ),
    );
  }
}

class _TallaZapatoCaja extends StatelessWidget {
  final double numero;
  const _TallaZapatoCaja(this.numero, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final zapatoModel = Provider.of<ZapatoModel>(context);
    return GestureDetector(
      onTap: () {
        final zapatoModel = Provider.of<ZapatoModel>(context, listen: false);
        zapatoModel.talla = numero;
      },
      child: Container(
        alignment: Alignment.center,
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          color: numero == zapatoModel.talla ? const Color(0xffF1A23A) : Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            if (numero == zapatoModel.talla)
              const BoxShadow(
                color: Color(0xffF1A23A),
                blurRadius: 10,
                offset: Offset(0, 5),
              ),
          ],
        ),
        child: Text(numero.toString().replaceAll('.0', ''),
            style: TextStyle(
              color: numero == zapatoModel.talla ? Colors.white : const Color(0xffF1A23A),
              fontSize: 16,
              fontWeight: FontWeight.bold,
            )),
      ),
    );
  }
}

class _ZapatoConSombra extends StatelessWidget {
  const _ZapatoConSombra({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final zapatoModel = Provider.of<ZapatoModel>(context);
    return Padding(
      padding: const EdgeInsets.all(50),
      child: Stack(
        children: [
          const Positioned(bottom: 20, right: 0, child: _SombraZapato()),
          Image(image: AssetImage(zapatoModel.assetImage)),
        ],
      ),
    );
  }
}

class _SombraZapato extends StatelessWidget {
  const _SombraZapato({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -0.55,
      child: Container(
        width: 230,
        height: 120,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(100)),
          boxShadow: [
            BoxShadow(
              color: Color(0xffEAA14E),
              blurRadius: 40,
            ),
          ],
        ),
      ),
    );
  }
}
