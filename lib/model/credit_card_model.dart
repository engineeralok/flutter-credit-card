import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class CreditCardModel {
  final String name;
  final String cardExpiration;
  final String cardHolder;
  final String cardNumber;
  final String category;
  // final Color? color;

  CreditCardModel({
    required this.name,
    required this.cardExpiration,
    required this.cardHolder,
    required this.cardNumber,
    required this.category,
    // Color? color,
  });
  // : color = color ?? Colors.orangeAccent;

  factory CreditCardModel.fromJson(Map<String, dynamic> json) {
    return CreditCardModel(
      name: json['name'] ?? '',
      cardExpiration: json['cardExpiration'] ?? '',
      cardHolder: json['cardHolder'] ?? '',
      cardNumber: json['cardNumber'] ?? '',
      category: json['category'] ?? '',
      // color: json['color'] != null ? Color(json['color']) : Colors.orangeAccent,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'cardExpiration': cardExpiration,
      'cardHolder': cardHolder,
      'cardNumber': cardNumber,
      'category': category,
      // 'color': color,
    };
  }
}
