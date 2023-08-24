import 'dart:convert';

import 'package:credit_card_project/model/credit_card_model.dart';
import 'package:credit_card_project/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppPref {
  Future<UserModel> getUser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? json = pref.getString("user");
    Map<String, dynamic> map = jsonDecode(json!);
    UserModel userModel = UserModel.fromJson(map);
    return userModel;
  }

  saveUser(UserModel userModel) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("userLogin", true);
    var strjson1 = jsonEncode(userModel);
    prefs.setString('userModel', strjson1);
  }

  getLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool("userLogin") ?? false;
  }

  // signOut() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setBool("userLogin", false);
  //   prefs.setString("userModel", "null");
  // }
  Future<void> signOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("userLogin"); // Remove user login status
    prefs.remove("userModel"); // Remove user data
    prefs.remove("creditCards"); // Remove credit card data
  }

  Future<List<CreditCardModel>> getCreditCards() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? json = prefs.getString("creditCards");
    if (json != null) {
      List<dynamic> list = jsonDecode(json);
      List<CreditCardModel> creditCards =
          list.map((item) => CreditCardModel.fromJson(item)).toList();
      return creditCards;
    }
    return []; // Return an empty list if no data is found
  }

  saveCreditCards(List<CreditCardModel> creditCards) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var jsonList = creditCards.map((card) => card.toJson()).toList();
    String jsonString = jsonEncode(jsonList);
    prefs.setString('creditCards', jsonString);
  }

  saveDummyCreditCards() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var jsonList = [
      {
        'name': 'HDFC Bank',
        'cardExpiration': '12/24',
        'cardHolder': 'Alok',
        'cardNumber': '2334 5687 8124 4134',
        'category': 'MasterCard',
      },
      {
        'name': 'HDFC Bank',
        'cardExpiration': '11/31',
        'cardHolder': 'Alok 2',
        'cardNumber': '3424 2433 1345 9787',
        'category': 'VISA',
      },
      {
        'name': 'HDFC Bank',
        'cardExpiration': '12/24',
        'cardHolder': 'Alok',
        'cardNumber': '2334 5687 8124 4134',
        'category': 'MasterCard',
      },
      {
        'name': 'HDFC Bank',
        'cardExpiration': '11/31',
        'cardHolder': 'Alok 2',
        'cardNumber': '3424 2433 1345 9787',
        'category': 'VISA',
      },
      {
        'name': 'Punjab National Bank',
        'cardExpiration': '11/31',
        'cardHolder': 'Alok 3',
        'cardNumber': '2354 2433 1345 9787',
        'category': 'MasterCard',
      },
    ];
    String jsonString = jsonEncode(jsonList);
    prefs.setString('creditCards', jsonString);
  }
}
