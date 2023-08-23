import 'dart:io';

import 'package:credit_card_project/routes/app_routes.dart';
import 'package:credit_card_project/theme/theme.dart';
import 'package:credit_card_project/utils/innitial_bindings.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  InitialBindings().dependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness:
          Platform.isAndroid ? Brightness.dark : Brightness.light,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarDividerColor: Colors.grey,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme(),
      getPages: AppRoutes.routes(),
    );

    // MaterialApp(
    //   title: 'Credit Cards Project',
    //   theme: ThemeData(fontFamily: 'Lato'),
    //   debugShowCheckedModeBanner: false,
    //   home: const LandingPage(),
    //   // const Scaffold(
    //   //   body: SafeArea(child: CreditCardsPage()),
    //   // ),
    // );
  }
}
