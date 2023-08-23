import 'package:credit_card_project/screens/auth/login_screen.dart';
import 'package:credit_card_project/screens/credit_cards_page.dart';
import 'package:credit_card_project/screens/landing_page.dart';
import 'package:credit_card_project/ui_view/slider_layout_view.dart';
import 'package:get/get.dart';

class AppRoutes {
  static List<GetPage> routes() => [
        GetPage(name: "/", page: () => const LandingPage()),
        GetPage(name: "/slider", page: () => const SliderLayoutView()),
        GetPage(name: "/Login", page: () => const LoginScreen()),
        GetPage(
          name: "/home",
          page: () => const CreditCardsPage(),
        ),
      ];
}
