import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:credit_card_project/utils/api_endpoints.dart';

class ApiService {
  Future<void> addNewCard(Map<String, dynamic> cardData) async {
    final url =
        Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.authEndPoints.addNewCard);
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'hello', // Replace 'hello' with your actual token
    };

    final response =
        await http.post(url, headers: headers, body: jsonEncode(cardData));

    if (response.statusCode == 201) {
      // Card added successfully
      // You can perform any required actions here

      Get.showSnackbar(
        const GetSnackBar(
          // title: "Hello",
          message: 'Card Added Successfully!',
          icon: Icon(CupertinoIcons.check_mark),
          backgroundColor: Colors.blueAccent,
          duration: Duration(seconds: 3),
        ),
      );
    } else {
      throw Exception('Failed to add card');
    }
  }
}
