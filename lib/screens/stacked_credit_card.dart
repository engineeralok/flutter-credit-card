import 'package:credit_card_project/constants/constants.dart';
import 'package:credit_card_project/controllers/fetch_credit_cards_controller.dart';
import 'package:credit_card_project/screens/credit_cards_page.dart';
import 'package:credit_card_project/screens/landing_page.dart';
import 'package:credit_card_project/screens/new_card/add_new_card.dart';
import 'package:credit_card_project/service/credit_card_data_manager.dart';
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
  final controller = Get.put(FetchCreditCardsController());
  @override
  Widget build(BuildContext context) {
    creditCardDataManager.fetchCreditCardData();
    return Scaffold(
      // drawer: Drawer(
      //   child: ListView(
      //     children: [
      //       ListTile(
      //         title: const Text("Credit Card Home"),
      //         onTap: () => Get.offAndToNamed(CreditCardsPage.routeName),
      //       )
      //     ],
      //   ),
      // ),
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        title: const Text('Account'),
        actions: [
          InkWell(
            onTap: () {
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
            child: const Row(
              children: [
                Text("Log Out"),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.exit_to_app),
                ),
              ],
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: StackedCardCarousel(
          initialOffset: 40,
          spaceBetweenItems: 250,
          applyTextScaleFactor: false,
          type: StackedCardCarouselType.cardsStack,
          items: buildStyleCards(context, controller.cards),
        ),
      ),
      floatingActionButton: addCardButtonFloatingButton(
        icon: const Icon(Icons.add),
        color: Constants.primaryColor,
        onPressed: () => Get.toNamed(AddNewCardScreen.rounteName),
      ),
    );
  }
}
