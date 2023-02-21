import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SlideShow extends StatelessWidget {
  final List<Widget> slides;
  final bool upperDots;
  final Color primaryColor;
  final Color secondaryColor;

  const SlideShow({
    Key? key,
    required this.slides,
    this.upperDots = false,
    this.primaryColor = Colors.blue,
    this.secondaryColor = Colors.grey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _SliderProvider(primaryColor, secondaryColor),
      child: SafeArea(
        bottom: false,
        child: Center(
          child: Column(
            children: [
              if (upperDots) _Dots(slides),
              Expanded(child: _Slides(slides)),
              if (!upperDots) _Dots(slides),
            ],
          ),
        ),
      ),
    );
  }
}

class _Dots extends StatelessWidget {
  final List<Widget> slides;
  const _Dots(this.slides, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(slides.length, (i) => _Dot(i)),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;
  const _Dot(this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sliderProvider = Provider.of<_SliderProvider>(context);
    final pageViewIndex = sliderProvider.currentPage;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: 12,
      height: 12,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: pageViewIndex >= index - 0.5 && pageViewIndex < index + 0.5
            ? sliderProvider.primaryColor
            : sliderProvider.secondaryColor,
        shape: BoxShape.circle,
      ),
    );
  }
}

class _Slides extends StatefulWidget {
  final List<Widget> slides;
  const _Slides(this.slides, {Key? key}) : super(key: key);

  @override
  State<_Slides> createState() => _SlidesState();
}

class _SlidesState extends State<_Slides> {
  final pageController = PageController();

  @override
  void initState() {
    pageController.addListener(() {
      Provider.of<_SliderProvider>(context, listen: false).currentPage =
          pageController.page!;
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: const BouncingScrollPhysics(),
      controller: pageController,
      children: widget.slides.map((slide) => _Slide(slide)).toList(),
    );
  }
}

class _Slide extends StatelessWidget {
  final Widget child;
  const _Slide(this.child, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      child: child,
    );
  }
}

class _SliderProvider with ChangeNotifier {
  double _currentPage = 0;
  Color _primaryColor = Colors.blue;
  Color _secondaryColor = Colors.grey;

  _SliderProvider(Color primary, Color secundary) {
    primaryColor = primary;
    secondaryColor = secundary;
  }

  double get currentPage => _currentPage;

  set currentPage(double currentPage) {
    _currentPage = currentPage;
    notifyListeners();
  }

  Color get secondaryColor => _secondaryColor;

  set secondaryColor(Color color) {
    _secondaryColor = color;
    notifyListeners();
  }

  Color get primaryColor => _primaryColor;

  set primaryColor(Color color) {
    _primaryColor = color;
    notifyListeners();
  }
}
