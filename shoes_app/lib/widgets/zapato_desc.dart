import 'package:flutter/material.dart';

class ZapatoDesc extends StatelessWidget {
  final String title;
  final String description;
  const ZapatoDesc(this.title, this.description, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w700)),
          const SizedBox(height: 20),
          Text(description, style: const TextStyle(color: Colors.black54, height: 1.5)),
        ],
      ),
    );
  }
}
