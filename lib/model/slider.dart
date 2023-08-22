import 'package:credit_card_project/constants/constants.dart';

class Slider {
  final String sliderImageUrl;
  final String sliderHeading;
  final String sliderSubHeading;

  Slider(
      {required this.sliderImageUrl,
      required this.sliderHeading,
      required this.sliderSubHeading});
}

final sliderArrayList = [
  Slider(
      sliderImageUrl: 'assets/images/slider_1.png',
      sliderHeading: Constants.sliderHeading1,
      sliderSubHeading: Constants.sliderDesc1),
  Slider(
      sliderImageUrl: 'assets/images/slider_2.png',
      sliderHeading: Constants.sliderHeading2,
      sliderSubHeading: Constants.sliderDesc2),
  Slider(
      sliderImageUrl: 'assets/images/slider_3.png',
      sliderHeading: Constants.sliderHeading3,
      sliderSubHeading: Constants.sliderDesc3),
];
