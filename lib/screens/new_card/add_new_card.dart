import 'dart:io';

import 'package:credit_card_project/constants/constants.dart';
import 'package:credit_card_project/model/credit_card_model.dart';
import 'package:credit_card_project/screens/new_card/components/card_type.dart';
import 'package:credit_card_project/screens/new_card/components/card_utilis.dart';
import 'package:credit_card_project/screens/new_card/components/input_formatters.dart';
import 'package:credit_card_project/service/new_card_api_service.dart';
import 'package:credit_card_project/utils/app_prefs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../controllers/fetch_credit_cards_controller.dart';

class AddNewCardScreen extends StatefulWidget {
  const AddNewCardScreen({Key? key}) : super(key: key);

  static const String rounteName = "/newCardScreen";

  @override
  State<AddNewCardScreen> createState() => _AddNewCardScreenState();
}

class _AddNewCardScreenState extends State<AddNewCardScreen> {
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController cardHolderController = TextEditingController();
  TextEditingController cardNameController = TextEditingController();
  TextEditingController cardExpirationController = TextEditingController();
  CardType cardType = CardType.Invalid;
  final ImagePicker imagePicker = ImagePicker();
  // List<dynamic>? imageFileList = [];
  // List<dynamic> photos = [];
  File? capturedImage;

  // void selectImages() async {
  //   final List<dynamic>? selectedImages = await imagePicker.pickMultiImage();
  //   if (selectedImages!.isNotEmpty) {
  //     if (selectedImages.length > 2 ||
  //         (selectedImages.length + imageFileList!.length + photos.length) > 2) {
  //       if (!mounted) return;
  //       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
  //           behavior: SnackBarBehavior.floating,
  //           backgroundColor: Colors.red,
  //           content: Text(
  //             "Select two images",
  //             style: TextStyle(color: Colors.white),
  //           )));
  //     } else {
  //       setState(() {
  //         imageFileList!.addAll(selectedImages);
  //       });
  //     }
  //   }
  // }

  void getCardTypeFrmNum() {
    //here we can identify the type in first 6 digits
    if (cardNumberController.text.length <= 6) {
      String cardNum = CardUtils.getCleanedNumber(cardNumberController.text);
      CardType type = CardUtils.getCardTypeFrmNumber(cardNum);
      if (type != cardType) {
        setState(() {
          cardType = type;
          print(cardType);
        });
      }
    }
  }

  void _addCard() async {
    try {
      final cardData = {
        'name': cardNameController.text,
        'cardExpiration':
            cardExpirationController.text, // Add card expiration here
        'cardHolder': cardHolderController.text, // Add card holder here
        'cardNumber': cardNumberController.text.trim(),
        'category': cardType.toString().split(".")[1], // Add card category here
      };

      // Update local card data (dummy data)
      List<CreditCardModel> updatedCreditCards =
          await AppPref().getCreditCards(); // Fetch existing credit cards
      updatedCreditCards.add(CreditCardModel(
        name: cardNameController.text,
        cardExpiration:
            cardExpirationController.text, // Add card expiration here
        cardHolder: cardHolderController.text, // Add card holder here
        cardNumber: cardNumberController.text.trim(),
        category: cardType.toString().split(".")[1], // Add card category here
      ));

      // Save updated card data using SharedPreferences
      await AppPref().saveCreditCards(updatedCreditCards);

      Get.find<FetchCreditCardsController>().updateCards(updatedCreditCards);

      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.green,
          content: Text(
            'Card added successfully to local storage!',
            style: TextStyle(color: Colors.white),
          ),
        ),
      );

      // Call the API to save card data
      await ApiService().addNewCard(cardData);
      // Navigate back or perform desired action
      cardExpirationController.clear();
      cardHolderController.clear();
      cardNameController.clear();
      cardNumberController.clear();
    } catch (e) {
      // Handle error
      Get.showSnackbar(
        const GetSnackBar(
          // title: "Hello",
          message: 'Card Not added in backend',
          icon: Icon(CupertinoIcons.restart),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 3),
        ),
      );
      print(e);
    }
  }

  @override
  void initState() {
    cardNumberController.addListener(
      () {
        getCardTypeFrmNum();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("New Card"),
      ),
      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: Constants.defaultPadding),
          child: Column(
            children: [
              // const Spacer(),
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      controller: cardNumberController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(16),
                        CardNumberInputFormatter(),
                      ],
                      decoration: InputDecoration(
                        hintText: "Card number",
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CardUtils.getCardIcon(cardType),
                        ),
                        prefixIcon: cardType == CardType.Invalid
                            ? null
                            : Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child:
                                    SvgPicture.asset("assets/icons/card.svg"),
                              ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: Constants.defaultPadding),
                      child: TextFormField(
                        controller: cardHolderController,
                        decoration: InputDecoration(
                          hintText: "Card Holder Name",
                          prefixIcon: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: SvgPicture.asset("assets/icons/user.svg"),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: Constants.defaultPadding),
                      child: TextFormField(
                        controller: cardNameController,
                        decoration: InputDecoration(
                          hintText: "Name with Bank Name",
                          prefixIcon: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: SvgPicture.asset("assets/icons/user.svg"),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        // Expanded(
                        //   child: TextFormField(
                        //     keyboardType: TextInputType.number,
                        //     //we can limit the input
                        //     inputFormatters: [
                        //       FilteringTextInputFormatter.digitsOnly,
                        //       LengthLimitingTextInputFormatter(3),
                        //     ],
                        //     decoration: InputDecoration(
                        //       hintText: "CVV",
                        //       prefixIcon: Padding(
                        //         padding:
                        //             const EdgeInsets.symmetric(vertical: 10),
                        //         child: SvgPicture.asset("assets/icons/Cvv.svg"),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        // const SizedBox(
                        //   width: Constants.defaultPadding,
                        // ),
                        Expanded(
                          child: TextFormField(
                            controller: cardExpirationController,
                            keyboardType: TextInputType.number,
                            //we can limit the input
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(5),
                              CardMonthInputFormatter(),
                            ],
                            decoration: InputDecoration(
                              hintText: "MM/YY",
                              prefixIcon: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: SvgPicture.asset(
                                    "assets/icons/calender.svg"),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: Constants.defaultPadding,
                        ),
                        const Expanded(
                          child: SizedBox(),
                          // TextFormField(
                          //   keyboardType: TextInputType.number,
                          //   //we can limit the input
                          //   inputFormatters: [
                          //     FilteringTextInputFormatter.digitsOnly,
                          //     LengthLimitingTextInputFormatter(3),
                          //   ],
                          //   decoration: InputDecoration(
                          //     hintText: "CVV",
                          //     prefixIcon: Padding(
                          //       padding:
                          //           const EdgeInsets.symmetric(vertical: 10),
                          //       child: SvgPicture.asset("assets/icons/Cvv.svg"),
                          //     ),
                          //   ),
                          // ),
                        ),
                      ],
                    )
                  ],
                ),
              ),

              // Container(
              //   child: capturedImage == null
              //       ? const Spacer(
              //           flex: 1,
              //         )
              //       : null,
              // ),

              Expanded(
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child:
                      capturedImage == null ? null : Image.file(capturedImage!),
                ),
              ),

              //Scan card button to click the image of the card
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () async {
                    final pickedImage =
                        await imagePicker.pickImage(source: ImageSource.camera);
                    if (pickedImage != null) {
                      setState(() {
                        capturedImage = File(pickedImage.path);
                      });
                    }
                  },
                  icon: SvgPicture.asset("assets/icons/scan.svg"),
                  label: const Text("Scan"),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: Constants.defaultPadding,
                    bottom: Constants.defaultPadding,
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      if (capturedImage == null) {
                        Get.showSnackbar(
                          const GetSnackBar(
                            // title: "Hello",
                            message: 'Click a credit card image fist!',
                            icon: Icon(CupertinoIcons.restart),
                            backgroundColor: Colors.red,
                            duration: Duration(seconds: 3),
                          ),
                        );
                      } else {
                        _addCard();
                      }
                    },
                    child: const Text(
                      "Add card",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
