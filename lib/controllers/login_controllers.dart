import 'dart:convert';

import 'package:credit_card_project/model/user_model.dart';
import 'package:credit_card_project/screens/credit_cards_page.dart';
import 'package:credit_card_project/screens/stacked_credit_card.dart';
import 'package:credit_card_project/utils/api_endpoints.dart';
import 'package:credit_card_project/utils/app_prefs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var isPasswordHidden = true.obs;
  var isLoading = false.obs;

  clearTextEditingController() {
    emailController.clear();
    passwordController.clear();
  }

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> loginWithEmail() async {
    isLoading.value = true;
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

        // final SharedPreferences prefs = await _prefs;
        // await prefs.setString('token', token);

        // final AppPref appPref = AppPref();

        final UserModel userModel = UserModel.fromJson(json);

        await AppPref().saveUser(userModel);
        await AppPref().saveDummyCreditCards();

        clearTextEditingController();
        //go to home

        Get.showSnackbar(
          const GetSnackBar(
            // title: "Hello",
            message: 'You have logged in successfully!',
            icon: Icon(CupertinoIcons.check_mark),
            backgroundColor: Colors.blueAccent,
            duration: Duration(seconds: 3),
          ),
        );
        Get.offAll( CreditCardsPage());
        isLoading.value = false;
      } else {
        isLoading.value = false;
        throw jsonDecode(response.body)["message"];
      }

      isLoading.value = false;
    } catch (e) {
      // Get.back();
      // showDialog(
      //   context: Get.context!,
      //   builder: (context) {
      //     return SimpleDialog(
      //       title: const Text("Error"),
      //       contentPadding: const EdgeInsets.all(20),
      //       children: [Text(e.toString())],
      //     );
      //   },
      // );
      Get.dialog(
        AlertDialog(
          title: const Text('Error'),
          content: Text(e.toString()),
          actions: [
            TextButton(
              onPressed: () {
                Get.back(); // Close the error dialog
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }
}
