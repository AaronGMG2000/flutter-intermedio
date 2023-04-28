import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class NavegacionPage extends StatelessWidget {
  static const String routeName = 'NavegacionPage';

  const NavegacionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _NotificationModel(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('NavegacionPage'),
          backgroundColor: Colors.pink,
        ),
        body: const Center(
          child: Text('NavegacionPage'),
        ),
        floatingActionButton: const BotonFlotante(),
        bottomNavigationBar: const BotonNavigation(),
      ),
    );
  }
}

class BotonFlotante extends StatelessWidget {
  const BotonFlotante({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.pink,
      onPressed: () {
        Provider.of<_NotificationModel>(context, listen: false).numero++;
        if (Provider.of<_NotificationModel>(context, listen: false).numero >= 2) {
          final controller = Provider.of<_NotificationModel>(context, listen: false).bounceController;
          controller.forward(from: 0.0);
        }
      },
      child: const Icon(Icons.play_arrow),
    );
  }
}

class BotonNavigation extends StatelessWidget {
  const BotonNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int numero = Provider.of<_NotificationModel>(context).numero;
    return BottomNavigationBar(
      currentIndex: 0,
      selectedItemColor: Colors.pink,
      items: [
        const BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.bone),
          label: 'Bones',
        ),
        BottomNavigationBarItem(
          label: 'Notifications',
          icon: Stack(children: [
            const FaIcon(FontAwesomeIcons.bell),
            Positioned(
              top: 0,
              right: 0,
              child: BounceInDown(
                from: 10,
                animate: (numero > 0),
                child: Bounce(
                  from: 10,
                  controller: (controller) => Provider.of<_NotificationModel>(context).bounceController = controller,
                  child: Container(
                    alignment: Alignment.center,
                    width: 12,
                    height: 12,
                    decoration: const BoxDecoration(
                      color: Colors.redAccent,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      '$numero',
                      style: const TextStyle(color: Colors.white, fontSize: 8),
                    ),
                  ),
                ),
              ),
            ),
          ]),
        ),
        const BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.dog),
          label: 'My Dog',
        ),
      ],
    );
  }
}

class _NotificationModel extends ChangeNotifier {
  late AnimationController bounceController;

  int _numero = 0;

  int get numero => _numero;

  set numero(int valor) {
    _numero = valor;
    notifyListeners();
  }
}
