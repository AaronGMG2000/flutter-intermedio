import 'package:flutter/material.dart';

class CUstomAppbar extends StatelessWidget {
  final String text;
  const CUstomAppbar(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        margin: const EdgeInsets.only(top: 30),
        child: Row(
          children: [
            Text(text, style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            const Spacer(),
            const IconButton(onPressed: null, icon: Icon(Icons.search)),
          ],
        ),
      ),
    );
  }
}
