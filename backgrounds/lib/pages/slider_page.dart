import 'package:flutter/material.dart';

class SliderPage extends StatelessWidget {
  const SliderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _MainScroll(),
    );
  }
}

class _MainScroll extends StatelessWidget {
  const _MainScroll({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final items = [
      const _ListItem('Orange', Color(0xffF08F66)),
      const _ListItem('Family', Color(0xffF2A38A)),
      const _ListItem('Subscriptions', Color(0xffF7CDD5)),
      const _ListItem('Books', Color(0xffFCEBAF)),
      const _ListItem('Orange', Color(0xffF08F66)),
      const _ListItem('Family', Color(0xffF2A38A)),
      const _ListItem('Subscriptions', Color(0xffF7CDD5)),
      const _ListItem('Books', Color(0xffFCEBAF)),
    ];
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverPersistentHeader(
            delegate: _SliverCustomHeaderDelegate(minHeight: 200, maxHeight: 250, child: const _Titulo()),
            floating: true),
        SliverList(delegate: SliverChildListDelegate(items)),
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
    return Column(
      children: [
        const SizedBox(height: 30),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: const Text('New', style: TextStyle(color: Color(0xff532128), fontSize: 50)),
        ),
        Stack(
          children: [
            const SizedBox(width: 100),
            Positioned(
              bottom: 8,
              child: Container(
                width: 150,
                height: 8,
                decoration: const BoxDecoration(color: Color(0xffF7CDD5)),
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
