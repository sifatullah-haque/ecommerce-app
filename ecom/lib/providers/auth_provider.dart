import 'dart:convert';

import 'package:ecom/core/constains/shared_preferance_key.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  bool isLoading = false;
  bool hasError = false;
  String? errorMessage;

  Future<bool> login(String email, String password) async {
    isLoading = true;
    notifyListeners();
    http.Response response = await http.post(
        Uri.parse("https://fakestoreapi.com/auth/login"),
        body: {"username": email, "password": password});
    if (response.statusCode == 200) {
      print(response.body);
      String token = jsonDecode(response.body)["token"];
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();

      bool isSavedToken = await sharedPreferences.setString(SharedPreferenceKey.Token, token);
      if (isSavedToken) {
        print("Token is Saved");
      } else {
        print("Token Is Not Saved");
      }

      return true;
    } else {
      print("Login Failed");
      hasError = true;
      errorMessage = "Failed to login";
    }
    isLoading = false;
    notifyListeners();
    return false;
  }
}
