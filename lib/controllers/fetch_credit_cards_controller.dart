import 'package:credit_card_project/model/credit_card_model.dart';
import 'package:credit_card_project/service/credit_card_data_manager.dart';
import 'package:credit_card_project/utils/app_prefs.dart';
import 'package:get/get.dart';

class FetchCreditCardsController extends GetxController {
  final creditCardDataManager = CreditCardDataManager();
  final cards = <CreditCardModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchCreditCards();
  }

  Future<void> fetchCreditCards() async {
    cards.assignAll(await AppPref().getCreditCards());
  }

    void updateCards(List<CreditCardModel> newCards) {
    cards.assignAll(newCards);
  }
}
