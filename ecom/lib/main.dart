import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'pages/login_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: (contex, child) => const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        home: LoginPage(),
      ),
    );
  }
}
