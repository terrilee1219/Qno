//Imports
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qnoclient/constants/theme_colors.dart';
import '../constants/app_assets.dart';

class OnboardSlidesCarousel extends StatefulWidget {
  //Class Variables
  @override
  _OnboardSlidesCarouselState createState() => _OnboardSlidesCarouselState();
}

class _OnboardSlidesCarouselState extends State<OnboardSlidesCarousel> {
  //Carousel states
  int _currentPageIndex = 0;

  static Widget _slideStructure(List<Widget> slideContent) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: slideContent,
      ),
    );
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }

  Widget _sliderHeaderText(String text) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40),
      child: Text(
        text,
        style: Theme.of(context)
            .textTheme
            .headline5
            .copyWith(fontFamily: "Numans", color: ThemeColors.purpleSwatch),
      ),
    );
  }

  Widget _sliderPassageText(String text) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 40),
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodyText1.copyWith(
              fontFamily: "Lato", color: ThemeColors.lightGrey, fontSize: 14),
          textAlign: TextAlign.start,
        ));
  }

  @override
  Widget build(BuildContext context) {
    //Runtime variables
    var deviceSize = MediaQuery.of(context).size;

    final List<Widget> _slides = [
      _slideStructure([
        SizedBox(
          height: deviceSize.height * 0.125,
        ),
        SvgPicture.asset(Assets.nfcLogo,
            height: deviceSize.height * 0.13,
            width: deviceSize.width * 0.28,
            color: ThemeColors.purpleSwatch),
        SizedBox(
          height: deviceSize.height * 0.20,
        ),
        _sliderHeaderText("Welcome to Qno"),
      ]),
      _slideStructure([
        SizedBox(
          height: deviceSize.height * 0.08,
        ),
        _sliderHeaderText("What is Qno?"),
        SizedBox(
          height: deviceSize.height * 0.10,
        ),
        SvgPicture.asset(
          Assets.slideImageOne,
          height: deviceSize.height * 0.29,
          width: deviceSize.width * 0.64,
        ),
        SizedBox(
          height: deviceSize.height * 0.10,
        ),
        _sliderPassageText(
            "Qno is the future of the square buzzers you get at fast food resteraunts.")
      ]),
      _slideStructure([
        SizedBox(
          height: deviceSize.height * 0.08,
        ),
        _sliderHeaderText("How does it work?"),
        SizedBox(
          height: deviceSize.height * 0.04,
        ),
        _sliderPassageText("Qno uses the nfc chip in your smartphone."),
        SizedBox(
          height: deviceSize.height * 0.08,
        ),
        SvgPicture.asset(
          Assets.slideImageTwo,
          height: deviceSize.height * 0.27,
          width: deviceSize.width * 0.76,
        ),
        SizedBox(
          height: deviceSize.height * 0.09,
        ),
        _sliderPassageText(
            "Make sure your NFC is turned on and tap your phone on the Qno machine after purchasing your meal.")
      ]),
      _slideStructure([
        SizedBox(
          height: deviceSize.height * 0.08,
        ),
        _sliderHeaderText("Receive Notifications"),
        SizedBox(
          height: deviceSize.height * 0.04,
        ),
        _sliderPassageText(
            "When you tap your phone, the Qno app will let you know the average waiting time."),
        SizedBox(
          height: deviceSize.height * 0.05,
        ),
        SvgPicture.asset(
          Assets.slideImageThree,
          height: deviceSize.height * 0.158,
          width: deviceSize.width * 0.46,
        ),
        SizedBox(
          height: deviceSize.height * 0.05,
        ),
        _sliderPassageText(
            "When your food is ready, you will receive a notification."),
        SizedBox(
          height: deviceSize.height * 0.05,
        ),
        SvgPicture.asset(
          Assets.slideImageFour,
          height: deviceSize.height * 0.15,
          width: deviceSize.width * 0.46,
        )
      ]),
      _slideStructure([
        SizedBox(
          height: deviceSize.height * 0.08,
        ),
        _sliderHeaderText("Simplify your life"),
        SizedBox(
          height: deviceSize.height * 0.05,
        ),
        _sliderPassageText(
            "Don’t stand around the counter waiting for your order to be ready."),
        SizedBox(
          height: deviceSize.height * 0.09,
        ),
        SvgPicture.asset(
          Assets.slideImageFive,
          height: deviceSize.height * 0.26,
          width: deviceSize.width * 0.82,
        ),
        SizedBox(
          height: deviceSize.height * 0.075,
        ),
        _sliderPassageText(
            "Continue shopping while your food is being prepared.")
      ])
    ];

    Widget _circleDotBuilder(int index) {
      return Container(
        width: 5.0,
        height: 5.0,
        margin: (index != _slides.length - 1)
            ? EdgeInsets.only(right: 3)
            : EdgeInsets.all(0.0),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: (index == _currentPageIndex) ? Colors.black : Colors.grey),
      );
    }

    return Expanded(
        child: Stack(children: [
      CarouselSlider(
        height: deviceSize.height,
        viewportFraction: 1.0,
        enlargeCenterPage: true,
        items: _slides,
        initialPage: 0,
        enableInfiniteScroll: false,
        onPageChanged: (index) => _onPageChanged(index),
      ),
      Positioned(
        left: 0.0,
        right: 0.0,
        bottom: 10.0,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: _slides
              .map((e) => _circleDotBuilder(_slides.indexOf(e)))
              .toList(),
        ),
      )
    ]));
  }
}
