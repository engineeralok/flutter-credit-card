import 'package:credit_card_project/model/credit_card_model.dart'; // Import the CreditCardModel
import 'package:get/get.dart';

class CreditCardController extends GetxController {
  Rx<CreditCardModel> selectedCard = CreditCardModel(
    name: '',
    cardExpiration: '',
    cardHolder: '',
    cardNumber: '',
    category: '',
    // color: null,
  ).obs;

  void setSelectedCard(CreditCardModel card) {
    selectedCard.value = card;
  }
}
