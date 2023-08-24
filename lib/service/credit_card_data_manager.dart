import 'package:credit_card_project/model/credit_card_model.dart';
import 'package:credit_card_project/utils/app_prefs.dart';

class CreditCardDataManager {
  List<CreditCardModel> creditCards = [];

  Future<void> fetchCreditCardData() async {
    creditCards = await AppPref().getCreditCards();
  }
}

final creditCardDataManager = CreditCardDataManager();
