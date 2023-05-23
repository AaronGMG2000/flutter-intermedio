import 'package:flutter/material.dart';
import 'package:shoes_app/widgets/boton_naranja.dart';

class AgregarCarritoBoton extends StatelessWidget {
  final double monto;
  const AgregarCarritoBoton(this.monto, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Row(
        children: [
          const SizedBox(width: 20),
          Text('\$$monto', style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
          const Spacer(),
          const BotonNaranja('Add to cart'),
          const SizedBox(width: 20),
        ],
      ),
    );
  }
}
