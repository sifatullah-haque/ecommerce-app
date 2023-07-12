import 'package:ecom/pages/home_page.dart';
import 'package:ecom/pages/login_page.dart';
import 'package:ecom/routers/middleWare/auth_middleWare.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class routeManagement {
  static final routeConfig = GoRouter(
    routes: [
      GoRoute(
        name: RouteName.HOME_PAGE,
        path: RouteName.HOME_PAGE,
        builder: (context, state) => const homePage(),
        redirect: (context, state) => AuthMiddleware.guardLogin(),
      ),
      GoRoute(
        name: RouteName.Login,
        path: RouteName.Login,
        builder: (context, state) => const LoginPage(),
      ),
    ],
  );
}

class RouteName {
  static String HOME_PAGE = '/home';
  static String Login = '/';
}
