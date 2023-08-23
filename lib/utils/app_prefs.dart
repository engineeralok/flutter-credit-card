import 'dart:convert';

import 'package:credit_card_project/model/user_model.dart';
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

  signOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("userLogin", false);
    prefs.setString("userModel", "null");
  }
}
