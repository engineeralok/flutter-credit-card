import 'dart:math';

import 'package:credit_card_project/constants/constants.dart';
import 'package:credit_card_project/controllers/fetch_credit_cards_controller.dart';
import 'package:credit_card_project/screens/landing_page.dart';
import 'package:credit_card_project/screens/new_card/add_new_card.dart';
import 'package:credit_card_project/screens/stacked_credit_card.dart';
import 'package:credit_card_project/utils/app_prefs.dart';
import 'package:credit_card_project/widgets/floating_button.dart';
import 'package:credit_card_project/widgets/style_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:credit_card_project/screens/single_card_detail_page.dart';
import 'package:get/get.dart';

class CreditCardsPage extends StatelessWidget {
  static const String routeName = "/home";

  CreditCardsPage({super.key});

  final controller = Get.put(FetchCreditCardsController());

  @override
  Widget build(BuildContext context) {
    // _fetchCreditCardData();
    // creditCardDataManager.fetchCreditCardData();
    // List<Widget> cardWidgets = buildStyleCards(context, controller.cards);
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: const Text("Stacked Card Carousal"),
              onTap: () => Get.offAndToNamed(StackedCreditCard.routeName),
            )
          ],
        ),
      ),
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Constants.defaultPadding,
            vertical: 30,
          ),
          child: Obx(
            () => Stack(
              children: List.generate(controller.cards.length, (index) {
                double offset = index * 30.0;
                Color randomColor = Color.fromARGB(
                  255,
                  Random().nextInt(100) + 100,
                  Random().nextInt(100) + 100,
                  Random().nextInt(100) + 100,
                );
                return Positioned(
                  top: offset,
                  left: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: () {
                      // Navigator.pushNamed(
                      //   context,
                      //   SingleCardDetailsPage.routeName,
                      //   arguments:
                      //       cardWidgets[index], // Pass the selected credit card
                      // );
                      Get.toNamed(
                        SingleCardDetailsPage.routeName,
                        arguments: controller.cards[index],
                      );
                      // Get.toNamed(
                      //   SingleCardDetailsPage.routeName,
                      //   arguments:
                      //       cardWidgets[index], // Pass the selected credit card
                      // );
                    },
                    child: buildCreditCard(
                      color: randomColor,
                      cardExpiration: controller.cards[index].cardExpiration,
                      cardHolder: controller.cards[index].cardHolder,
                      cardNumber: controller.cards[index].cardNumber,
                    ),
                  ),
                );
              }),
            ),
          ),
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


// class CreditCardsPage extends StatelessWidget {
//   const CreditCardsPage({super.key});

//   static const String routeName = "/home";

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Expanded(
//             child: Container(
//               height: MediaQuery.of(context).size.height,
//               width: MediaQuery.of(context).size.width,
//               padding: const EdgeInsets.all(8.0),
//               child: Stack(
//                 children: [
//                   Positioned(
//                     top: 0,
//                     left: 0,
//                     right: 0,
//                     child: Center(
//                       child: SizedBox(
//                         // padding: EdgeInsets.symmetric(horizontal: 20),
//                         width: MediaQuery.of(context).size.width * 0.9,
//                         child: _buildCreditCard(
//                           color: const Color(0xFF090943),
//                           cardExpiration: "08/2022",
//                           cardHolder: "HOUSSEM SELMI",
//                           cardNumber: "3546 7532 XXXX 9742",
//                         ),
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     top: 30,
//                     left: 0,
//                     right: 0,
//                     child: Center(
//                       child: SizedBox(
//                         // padding: EdgeInsets.symmetric(horizontal: 20),
//                         width: MediaQuery.of(context).size.width * 0.9,
//                         child: _buildCreditCard(
//                             color: const Color(0xFF090943),
//                             cardExpiration: "08/2022",
//                             cardHolder: "HOUSSEM SELMI",
//                             cardNumber: "3546 7532 XXXX 9742"),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   // Build the title section
//   Column _buildTitleSection({required title, required subTitle}) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         Padding(
//           padding: const EdgeInsets.only(left: 8.0, top: 16.0),
//           child: Text(
//             '$title',
//             style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.only(left: 8.0, bottom: 16.0),
//           child: Text(
//             '$subTitle',
//             style: const TextStyle(fontSize: 21, color: Colors.black45),
//           ),
//         )
//       ],
//     );
//   }

//   // Build the credit card widget
//   Card _buildCreditCard(
//       {required Color color,
//       required String cardNumber,
//       required String cardHolder,
//       required String cardExpiration}) {
//     return Card(
//       elevation: 4.0,
//       color: color,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(14),
//       ),
//       child: Container(
//         height: 200,
//         padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 22.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: <Widget>[
//             _buildLogosBlock(),
//             Padding(
//               padding: const EdgeInsets.only(top: 16.0),
//               child: Text(
//                 cardNumber,
//                 style: const TextStyle(
//                     color: Colors.white,
//                     fontSize: 21,
//                     fontFamily: 'CourrierPrime'),
//               ),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[
//                 _buildDetailsBlock(
//                   label: 'CARDHOLDER',
//                   value: cardHolder,
//                 ),
//                 _buildDetailsBlock(label: 'VALID THRU', value: cardExpiration),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // Build the top row containing logos
//   Row _buildLogosBlock() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: <Widget>[
//         Image.asset(
//           "assets/images/contact_less.png",
//           height: 20,
//           width: 18,
//         ),
//         Image.asset(
//           "assets/images/mastercard.png",
//           height: 50,
//           width: 50,
//         ),
//       ],
//     );
//   }

// // Build Column containing the cardholder and expiration information
//   Column _buildDetailsBlock({required String label, required String value}) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         Text(
//           label,
//           style: const TextStyle(
//               color: Colors.grey, fontSize: 9, fontWeight: FontWeight.bold),
//         ),
//         Text(
//           value,
//           style: const TextStyle(
//               color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
//         )
//       ],
//     );
//   }

// // Build the FloatingActionButton
//   Container _buildAddCardButton({
//     required Icon icon,
//     required Color color,
//   }) {
//     return Container(
//       margin: const EdgeInsets.only(top: 24.0),
//       alignment: Alignment.center,
//       child: FloatingActionButton(
//         elevation: 2.0,
//         onPressed: () {
//           print("Add a credit card");
//         },
//         backgroundColor: color,
//         mini: false,
//         child: icon,
//       ),
//     );
//   }
// }