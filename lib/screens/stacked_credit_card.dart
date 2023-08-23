// import 'package:credit_card_project/widgets/style_card.dart';
import 'package:credit_card_project/routes/app_routes.dart';
import 'package:credit_card_project/screens/landing_page.dart';
import 'package:credit_card_project/screens/onBoardingSlider/slider_layout_view.dart';
import 'package:credit_card_project/utils/app_prefs.dart';
import 'package:credit_card_project/widgets/floating_button.dart';
import 'package:credit_card_project/widgets/style_cards.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stacked_card_carousel/stacked_card_carousel.dart';

class StackedCreditCard extends StatefulWidget {
  const StackedCreditCard({super.key});

  static const String routeName = "/stackedCreditCard";

  @override
  State<StackedCreditCard> createState() => _StackedCreditCardState();
}

class _StackedCreditCardState extends State<StackedCreditCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Account'),
          actions: [
            Row(
              children: [
                const Text("Log Out"),
                IconButton(
                    onPressed: () {
                      AppPref().signOut();
                      Get.offAllNamed(LandingPage.routeName);
                      Get.showSnackbar(
                        const GetSnackBar(
                          // title: "Hello",
                          message: 'You have logged out successfully!',
                          icon: Icon(CupertinoIcons.check_mark),
                          backgroundColor: Colors.blueAccent,
                          duration: Duration(seconds: 3),
                        ),
                      );
                    },
                    icon: const Icon(Icons.exit_to_app)),
              ],
            )
          ],
        ),
        body:
            // Stack(
            //   children: styleCards.map((card) {
            //     return SizedBox(
            //       child: card,
            //     );
            //   }).toList(),
            // ),
            Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: StackedCardCarousel(
            initialOffset: 40,
            spaceBetweenItems: 250,
            applyTextScaleFactor: false,
            type: StackedCardCarouselType.cardsStack,
            items: styleCards,
          ),
        ),
        floatingActionButton: addCardButtonFloatingButton(
          icon: const Icon(Icons.add),
          color: Colors.orangeAccent,
          onPressed: () {},
        ));
  }
}
