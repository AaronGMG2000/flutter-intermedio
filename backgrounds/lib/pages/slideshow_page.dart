import 'package:backgrounds/theme/theme.dart';
import 'package:backgrounds/widgets/slideshow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SlideshowPage extends StatelessWidget {
  const SlideshowPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          child: SlideShow(
            primaryColor: appTheme.dartTheme ? appTheme.currentTheme.colorScheme.secondary : Colors.orange,
            slides: [
              SvgPicture.asset('assets/svgs/slide-1.svg'),
              SvgPicture.asset('assets/svgs/slide-2.svg'),
              SvgPicture.asset('assets/svgs/slide-3.svg'),
              SvgPicture.asset('assets/svgs/slide-4.svg'),
              SvgPicture.asset('assets/svgs/slide-5.svg'),
            ],
          ),
        ),
        Expanded(
          child: SlideShow(
            primaryColor: appTheme.dartTheme ? appTheme.currentTheme.colorScheme.secondary : Colors.orange,
            slides: [
              SvgPicture.asset('assets/svgs/slide-1.svg'),
              SvgPicture.asset('assets/svgs/slide-2.svg'),
              SvgPicture.asset('assets/svgs/slide-3.svg'),
              SvgPicture.asset('assets/svgs/slide-4.svg'),
              SvgPicture.asset('assets/svgs/slide-5.svg'),
            ],
          ),
        ),
      ],
    ));
  }
}
