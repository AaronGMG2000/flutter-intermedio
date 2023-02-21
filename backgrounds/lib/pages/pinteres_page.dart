import 'package:backgrounds/widgets/pinterest_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class PinteresPage extends StatelessWidget {
  const PinteresPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _MenuModel(),
      child: Scaffold(
        body: Stack(
          children: const [
            _PinterestGrid(),
            _PinterestMenuLocation(),
          ],
        ),
      ),
    );
  }
}

class _PinterestMenuLocation extends StatelessWidget {
  const _PinterestMenuLocation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final menuProvider = Provider.of<_MenuModel>(context);
    return Positioned(
      bottom: 30,
      child: Container(
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        child: PinterestMenu(mostrar: menuProvider.mostrar),
      ),
    );
  }
}

class _PinterestGrid extends StatefulWidget {
  const _PinterestGrid({
    Key? key,
  }) : super(key: key);

  @override
  State<_PinterestGrid> createState() => _PinterestGridState();
}

class _PinterestGridState extends State<_PinterestGrid> {
  final ScrollController controler = ScrollController();

  @override
  void initState() {
    controler.addListener(() {
      if (controler.position.userScrollDirection == ScrollDirection.reverse) {
        Provider.of<_MenuModel>(context, listen: false).mostrar = false;
      } else {
        Provider.of<_MenuModel>(context, listen: false).mostrar = true;
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    controler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: controler,
      child: StaggeredGrid.count(
        crossAxisCount: 4,
        crossAxisSpacing: 4,
        mainAxisSpacing: 4,
        children: List.generate(45, (index) => _PinterestItem(index)),
      ),
    );
  }
}

class _PinterestItem extends StatelessWidget {
  final int index;
  const _PinterestItem(this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StaggeredGridTile.count(
      crossAxisCellCount: 2,
      mainAxisCellCount: index.isEven ? 2 : 3,
      child: Container(
        margin: const EdgeInsets.all(5),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          color: Colors.blue,
        ),
        child: Center(
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: Text('$index'),
          ),
        ),
      ),
    );
  }
}

class _MenuModel with ChangeNotifier {
  bool _mostrar = true;
  bool get mostrar => _mostrar;
  set mostrar(bool valor) {
    _mostrar = valor;
    notifyListeners();
  }
}
