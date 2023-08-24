// import 'package:credit_card_project/screens/single_card_detail_page.dart';
// import 'package:credit_card_project/widgets/style_card.dart';
// import 'package:flutter/material.dart';
// import 'package:credit_card_project/constants/credit_cards_dummy.dart';
// import 'package:get/get.dart'; // Import the credit card dummy data
// import 'package:credit_card_project/constants/credit_cards_dummy.dart';

// final List<CreditCard> styleCards =
//     creditCards; // Use the credit card dummy data

// List<Widget> buildStyleCards() {
//   List<Widget> cardWidgets = [];

//   for (var card in styleCards) {
//     cardWidgets.add(buildCreditCard(
//       color: card.color,
//       cardExpiration: card.cardExpiration,
//       cardHolder: card.cardHolder,
//       cardNumber: card.cardNumber,
//       onPressed: () {
//         // Pass the selected card to the SingleCardDetailsPage
//         Get.toNamed(
//           SingleCardDetailsPage.routeName,
//           arguments: card,
//         );
//       },
//     ));
//   }

//   return cardWidgets;
// }

import 'dart:math';

import 'package:credit_card_project/controllers/fetch_credit_cards_controller.dart';
import 'package:credit_card_project/screens/single_card_detail_page.dart';
import 'package:credit_card_project/widgets/style_card.dart';
import 'package:flutter/material.dart';
import 'package:credit_card_project/model/credit_card_model.dart'; // Import the CreditCardModel
import 'package:get/get.dart';

final List<CreditCardModel> styleCards =
    []; // Create an empty list for styleCards

List<Widget> buildStyleCards(
    BuildContext context, List<CreditCardModel> cards) {
  List<Widget> cardWidgets = [];

  Color randomColor = Color.fromARGB(
    255,
    Random().nextInt(100) + 100,
    Random().nextInt(100) + 100,
    Random().nextInt(100) + 100,
  );

  // final controller = Get.put(FetchCreditCardsController());

  for (var card in cards) {
    cardWidgets.add(
      GestureDetector(
        onTap: () {
          Get.toNamed(
            SingleCardDetailsPage.routeName,
            arguments: card, // Pass a CreditCardModel instance
          );
        },
        child: buildCreditCard(
          color: randomColor,
          cardExpiration: card.cardExpiration,
          cardHolder: card.cardHolder,
          cardNumber: card.cardNumber,
        ),
      ),
    );
  }

  return cardWidgets;
}


  // for (var card in styleCards) {
  //   cardWidgets.add(
  //     GestureDetector(
  //       onTap: () {
  //         Get.toNamed(
  //           SingleCardDetailsPage.routeName,
  //           arguments: card,
  //         );
  //       },
  //       child: buildCreditCard(
  //         color:card.color ?? Colors.orangeAccent,
  //         cardExpiration: card.cardExpiration,
  //         cardHolder: card.cardHolder,
  //         cardNumber: card.cardNumber,
  //       ),
  //     ),
  //   );
  // }

  // for (var card in creditCardDataManager.creditCards) {
  //   // Use the credit card data from CreditCardDataManager
  //   cardWidgets.add(
  //     GestureDetector(
  //       onTap: () {
  //         Get.toNamed(
  //           SingleCardDetailsPage.routeName,
  //           arguments: card,
  //         );
  //       },
  //       child: buildCreditCard(
  //         color:  Colors.orangeAccent,
  //         cardExpiration: card.cardExpiration,
  //         cardHolder: card.cardHolder,
  //         cardNumber: card.cardNumber,
  //       ),
  //     ),
  //   );
  // }