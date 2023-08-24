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

class RegistrationController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  clearTextEditingController() {
    nameController.clear();
    emailController.clear();
    passwordController.clear();
  }

  var isPasswordHidden = true.obs;
  var isChecked = false.obs;
  var isLoading = false.obs;

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> regiterWithEmail() async {
    isLoading.value = true;
    try {
      var headers = {'Content-Type': 'application/json'};
      var url = Uri.parse(
          ApiEndPoints.baseUrl + ApiEndPoints.authEndPoints.registerEmail);

      Map body = {
        'name': nameController.text,
        'email': emailController.text.trim(),
        'password': passwordController.text,
      };

      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: headers);

      if (response.statusCode == 201) {
        final json = jsonDecode(response.body);

        final token = json['tokens']["access"]["token"];
        print(token);

        // final SharedPreferences prefs = await _prefs;

        // await prefs.setString('token', token);
        // AppPref().saveUser(json);
        final UserModel userModel = UserModel.fromJson(json);

        await AppPref().saveUser(userModel);
        await AppPref().saveDummyCreditCards();

        clearTextEditingController();
        //goto home

        Get.showSnackbar(
          const GetSnackBar(
            // title: "Hello",
            message: 'You have registered successfully!',
            icon: Icon(CupertinoIcons.check_mark),
            backgroundColor: Colors.blueAccent,
            duration: Duration(seconds: 3),
          ),
        );

        Get.offAll( CreditCardsPage());
        // Get.offAll(const StackedCreditCard());
        isLoading.value = false;
      } else {
        isLoading.value = false;
        throw jsonDecode(response.body)["message"] ?? "Unknown error";
      }

      isLoading.value = false;
    } catch (e) {
      // showDialog(
      //   context: Get.context!,
      //   builder: (context) {
      //     return SimpleDialog(
      //       title: const Text('Error'),
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
