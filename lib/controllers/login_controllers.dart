import 'dart:convert';

import 'package:credit_card_project/screens/credit_cards_page.dart';
import 'package:credit_card_project/screens/landing_page.dart';
import 'package:credit_card_project/utils/api_endpoints.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var isPasswordHidden = true.obs;

  clearTextEditingController() {
    emailController.clear();
    passwordController.clear();
  }

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> loginWithEmail() async {
    var headers = {'Content-Type': 'application/json'};

    try {
      var url = Uri.parse(
          ApiEndPoints.baseUrl + ApiEndPoints.authEndPoints.loginEmail);
      Map body = {
        'email': emailController.text.trim(),
        'password': passwordController.text,
      };

      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: headers);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);

        final token = json["tokens"]["access"]["token"];

        final SharedPreferences prefs = await _prefs;
        await prefs.setString('token', token);

        clearTextEditingController();
        //go to home

        Get.showSnackbar(
          const GetSnackBar(
            // title: "Hello",
            message: 'You have logged in successfully!',
            icon: Icon(CupertinoIcons.check_mark),
            backgroundColor: Colors.green,
            duration: Duration(seconds: 3),
          ),
        );
        Get.offAll(const CreditCardsPage());
      } else {
        throw jsonDecode(response.body)["message"];
      }
    } catch (e) {
      Get.back();
      showDialog(
        context: Get.context!,
        builder: (context) {
          return SimpleDialog(
            title: const Text("Error"),
            contentPadding: const EdgeInsets.all(20),
            children: [Text(e.toString())],
          );
        },
      );
    }
  }
}
