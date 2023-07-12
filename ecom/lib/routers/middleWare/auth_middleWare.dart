import 'dart:async';

import 'package:ecom/core/constains/shared_preferance_key.dart';
import 'package:ecom/routers/route_management.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthMiddleware {
  static FutureOr<String> guardLogin() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    String? token = sharedPreferences.getString(SharedPreferenceKey.Token);

    if (token != null) {
      return RouteName.HOME_PAGE;
    }
    return RouteName.Login;
  }
}
