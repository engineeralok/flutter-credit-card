import 'dart:math';

import 'package:credit_card_project/constants/constants.dart';
import 'package:credit_card_project/controllers/credit_card_controller.dart';
import 'package:credit_card_project/model/credit_card_model.dart';
import 'package:flutter/material.dart';
import 'package:credit_card_project/widgets/style_card.dart';
import 'package:get/get.dart'; // Import your style_card.dart

class SingleCardDetailsPage extends StatelessWidget {
  final CreditCardController creditCardController = Get.find();

  static const String routeName = "/singleCardDetailPage";

  SingleCardDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedCard =
        Get.arguments as CreditCardModel; // Retrieve selected card

    Color randomColor = Color.fromARGB(
      255,
      Random().nextInt(100) + 100,
      Random().nextInt(100) + 100,
      Random().nextInt(100) + 100,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Card Details'),
      ),
      body: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: Constants.defaultPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            buildCreditCard(
              color: randomColor,
              cardNumber: selectedCard.cardNumber,
              cardHolder: selectedCard.cardHolder,
              cardExpiration: selectedCard.cardExpiration,
            ),
          ],
        ),
      ),
    );
  }
}
