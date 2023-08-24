import 'package:credit_card_project/controllers/credit_card_controller.dart';
import 'package:credit_card_project/controllers/login_controllers.dart';
import 'package:credit_card_project/controllers/registration_controller.dart';
import 'package:get/get.dart';

class InitialBindings implements Bindings {
  @override
  void dependencies() async {
    Get.put(RegistrationController());
    Get.put(LoginController());
    Get.put(CreditCardController());
  }
}
