import 'package:backgrounds/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SliderPage extends StatelessWidget {
  const SliderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [_MainScroll(), Positioned(bottom: 0, right: 0, child: _BotonNewList())],
      ),
    );
  }
}

class _BotonNewList extends StatelessWidget {
  const _BotonNewList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final appTheme = Provider.of<ThemeChanger>(context);
    return ButtonTheme(
      child: ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
              appTheme.dartTheme ? appTheme.currentTheme.colorScheme.secondary : const Color(0xffED6762),
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                const RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(50)))),
          ),
          child: SizedBox(
            height: size.height * 0.1,
            width: size.width * 0.7,
            child: Center(
                child: Text(
              'CREATE NEW LIST',
              style: TextStyle(
                  color: appTheme.currentTheme.scaffoldBackgroundColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2),
            )),
          )),
    );
  }
}

class _MainScroll extends StatelessWidget {
  const _MainScroll({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    final items = [
      _ListItem('Orange', appTheme.dartTheme ? const Color.fromARGB(255, 252, 99, 34) : const Color(0xffF08F66)),
      _ListItem('Family', appTheme.dartTheme ? const Color.fromARGB(255, 239, 91, 46) : const Color(0xffF2A38A)),
      _ListItem(
          'Subscriptions', appTheme.dartTheme ? const Color.fromARGB(255, 245, 67, 100) : const Color(0xffF7CDD5)),
      _ListItem('Books', appTheme.dartTheme ? const Color.fromARGB(255, 254, 208, 40) : const Color(0xffFCEBAF)),
      _ListItem('Orange', appTheme.dartTheme ? const Color.fromARGB(255, 255, 117, 58) : const Color(0xffF08F66)),
      _ListItem('Family', appTheme.dartTheme ? const Color.fromARGB(255, 249, 114, 73) : const Color(0xffF2A38A)),
      _ListItem('Subscriptions', appTheme.dartTheme ? const Color.fromARGB(255, 251, 46, 83) : const Color(0xffF7CDD5)),
      _ListItem('Books', appTheme.dartTheme ? const Color.fromARGB(255, 221, 179, 27) : const Color(0xffFCEBAF)),
    ];
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverPersistentHeader(
          delegate: _SliverCustomHeaderDelegate(
            minHeight: 170,
            maxHeight: 200,
            child: Container(
              alignment: Alignment.centerLeft,
              color: appTheme.currentTheme.scaffoldBackgroundColor,
              child: const _Titulo(),
            ),
          ),
          floating: true,
        ),
        SliverList(delegate: SliverChildListDelegate([...items, const SizedBox(height: 100)])),
      ],
    );
  }
}

class _SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;
  _SliverCustomHeaderDelegate({required this.minHeight, required this.maxHeight, required this.child});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) => SizedBox.expand(child: child);

  @override
  double get maxExtent => (minHeight > maxHeight) ? minHeight : maxHeight;

  @override
  double get minExtent => (maxHeight < minHeight) ? maxHeight : minHeight;

  @override
  bool shouldRebuild(_SliverCustomHeaderDelegate oldDelegate) =>
      maxHeight != oldDelegate.maxExtent || minHeight != oldDelegate.minExtent || child != oldDelegate.child;
}

class _Titulo extends StatelessWidget {
  const _Titulo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    return Column(
      children: [
        const SizedBox(height: 30),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Text('New',
              style: TextStyle(
                color: appTheme.dartTheme ? Colors.grey : const Color(0xff532128),
                fontSize: 50,
              )),
        ),
        Stack(
          children: [
            const SizedBox(width: 100),
            Positioned(
              bottom: 8,
              child: Container(
                width: 150,
                height: 8,
                color: appTheme.dartTheme ? Colors.grey : const Color(0xffF7CDD5),
              ),
            ),
            const Text(
              'List',
              style: TextStyle(
                color: Color(0xffD93A30),
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        )
      ],
    );
  }
}

class _ListItem extends StatelessWidget {
  final String title;
  final Color color;
  const _ListItem(
    this.title,
    this.color, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(30),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(30)),
      child: Text(
        title,
        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
      ),
    );
  }
}
