import 'package:credit_card_project/constants/constants.dart';
import 'package:credit_card_project/model/slider.dart';
import 'package:credit_card_project/screens/auth/login_screen.dart';
import 'package:credit_card_project/widgets/slide_dots.dart';
import 'package:credit_card_project/widgets/slide_items/slide_item.dart';
import 'package:flutter/material.dart';

class SliderLayoutView extends StatefulWidget {
  const SliderLayoutView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SliderLayoutViewState();
}

class _SliderLayoutViewState extends State<SliderLayoutView> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: <Widget>[
          PageView.builder(
            scrollDirection: Axis.horizontal,
            controller: _pageController,
            onPageChanged: _onPageChanged,
            itemCount: sliderArrayList.length,
            itemBuilder: (ctx, i) => SlideItem(i),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 15.0, bottom: 15.0),
              child: TextButton(
                onPressed: () {
                  if (_currentPage < sliderArrayList.length - 1) {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.ease,
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()),
                    );
                  }
                },
                child: const Text(
                  Constants.next,
                  style: TextStyle(
                    fontFamily: Constants.openSans,
                    fontWeight: FontWeight.w600,
                    fontSize: 14.0,
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0, bottom: 15.0),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()),
                  );
                },
                child: const Text(
                  Constants.skip,
                  style: TextStyle(
                    fontFamily: Constants.openSans,
                    fontWeight: FontWeight.w600,
                    fontSize: 14.0,
                  ),
                ),
              ),
            ),
          ),
          Container(
            alignment: AlignmentDirectional.bottomCenter,
            margin: const EdgeInsets.only(bottom: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                for (int i = 0; i < sliderArrayList.length; i++)
                  if (i == _currentPage)
                    const SlideDots(true)
                  else
                    const SlideDots(false),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
