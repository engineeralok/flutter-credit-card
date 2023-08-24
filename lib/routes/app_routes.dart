import 'package:credit_card_project/screens/auth/login_screen.dart';
import 'package:credit_card_project/screens/auth/register_screen.dart';
import 'package:credit_card_project/screens/credit_cards_page.dart';
import 'package:credit_card_project/screens/landing_page.dart';
import 'package:credit_card_project/screens/new_card/add_new_card.dart';
import 'package:credit_card_project/screens/onBoardingSlider/slider_layout_view.dart';
import 'package:credit_card_project/screens/single_card_detail_page.dart';
import 'package:credit_card_project/screens/stacked_credit_card.dart';
import 'package:get/get.dart';

class AppRoutes {
  static List<GetPage> routes() => [
        GetPage(name: "/", page: () => const LandingPage()),
        GetPage(name: "/slider", page: () => const SliderLayoutView()),
        GetPage(name: "/login", page: () => const LoginScreen()),
        GetPage(name: "/register", page: () => const RegisterScreen()),
        GetPage(
          name: "/home",
          page: () =>  CreditCardsPage(),
        ),
        GetPage(
          name: "/stackedCreditCard",
          page: () => const StackedCreditCard(),
        ),
        GetPage(
          name: "/newCardScreen",
          page: () => const AddNewCardScreen(),
        ),
        GetPage(
          name: "/newCardScreen",
          page: () => const AddNewCardScreen(),
        ),
        GetPage(
          name: SingleCardDetailsPage.routeName,
          page: () => SingleCardDetailsPage(),
        ),
      ];
}
