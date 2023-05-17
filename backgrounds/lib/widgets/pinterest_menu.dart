import 'package:backgrounds/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PinterestButton {
  final Function onPressed;
  final IconData icon;

  PinterestButton({required this.onPressed, required this.icon});
}

class PinterestMenu extends StatelessWidget {
  final bool mostrar;
  const PinterestMenu({Key? key, this.mostrar = true}) : super(key: key);
  static final List<PinterestButton> items = [
    PinterestButton(onPressed: () => debugPrint('pie_chart'), icon: Icons.pie_chart),
    PinterestButton(onPressed: () => debugPrint('search'), icon: Icons.search),
    PinterestButton(onPressed: () => debugPrint('notifications'), icon: Icons.notifications),
    PinterestButton(onPressed: () => debugPrint('supervised_user_circle'), icon: Icons.supervised_user_circle),
  ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _MenuModel(),
      child: AnimatedOpacity(
        opacity: mostrar ? 1 : 0,
        duration: const Duration(milliseconds: 250),
        child: _PinterestMenuBackground(
          child: _MenuItems(items),
        ),
      ),
    );
  }
}

class _PinterestMenuBackground extends StatelessWidget {
  const _PinterestMenuBackground({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;
    return Container(
      width: 250,
      height: 60,
      decoration: BoxDecoration(
          color: appTheme.scaffoldBackgroundColor,
          borderRadius: const BorderRadius.all(Radius.circular(100)),
          boxShadow: const <BoxShadow>[BoxShadow(color: Colors.black, blurRadius: 10, spreadRadius: -5)]),
      child: child,
    );
  }
}

class _MenuItems extends StatelessWidget {
  final List<PinterestButton> menuItems;
  const _MenuItems(this.menuItems, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(menuItems.length, (i) => _PinterestMenuButton(i, menuItems[i])),
    );
  }
}

class _PinterestMenuButton extends StatelessWidget {
  final int index;
  final PinterestButton item;
  const _PinterestMenuButton(this.index, this.item, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final menuProvider = Provider.of<_MenuModel>(context);
    final itemSeleccionado = menuProvider.itemSeleccionado;
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;
    return GestureDetector(
      onTap: () {
        menuProvider.itemSeleccionado = index;
        item.onPressed();
      },
      child: Icon(
        item.icon,
        size: itemSeleccionado == index ? 30 : 25,
        color: itemSeleccionado == index ? appTheme.colorScheme.secondary : Colors.blueGrey,
      ),
    );
  }
}

class _MenuModel with ChangeNotifier {
  int _itemSeleccionado = 0;
  int get itemSeleccionado => _itemSeleccionado;
  set itemSeleccionado(int index) {
    _itemSeleccionado = index;
    notifyListeners();
  }
}
