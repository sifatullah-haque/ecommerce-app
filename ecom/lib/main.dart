import 'package:ecom/providers/auth_provider.dart';
import 'package:ecom/routers/route_management.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'pages/login_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: (contex, child) => MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (contex) => AuthProvider(),
          ),
        ],
        child: MaterialApp.router(
          routerConfig: routeManagement.routeConfig,
          debugShowCheckedModeBanner: false,
          title: 'Material App',
        ),
      ),
    );
  }
}
