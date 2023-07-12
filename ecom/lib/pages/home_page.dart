import 'package:ecom/core/constains/shared_preferance_key.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class homePage extends StatelessWidget {
  const homePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
              child: Column(
                children: [
                  Text("This is our home page"),
                  ElevatedButton(
                    onPressed: () async {
                      SharedPreferences logOut =
                          await SharedPreferences.getInstance();
                      bool isLoggedOut =
                          await logOut.remove(SharedPreferenceKey.Token);
                      if (isLoggedOut) {
                        print("Logged Out");
                      } else {
                        print("Not Logged Out");
                      }
                    },
                    child: Text("Log Out"),
                  ),
                ],
              )),
        ));
  }
}
