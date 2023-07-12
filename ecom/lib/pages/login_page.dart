import 'package:ecom/core/constains/my_colors.dart';
import 'package:ecom/providers/auth_provider.dart';
import 'package:ecom/routers/route_management.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
            child: Column(
              children: [
                _LoginSignUpWithAvatar(),
                _LogoPortion(),
                _LoginSignUpForm(),
              ],
            ),
          ),
        ));
  }
}

class _LoginSignUpForm extends StatelessWidget {
  const _LoginSignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController _emailTextController = TextEditingController();
    TextEditingController _passwordTextController = TextEditingController();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Email",
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        SizedBox(height: 5.h),
        TextField(
          controller: _emailTextController,
          decoration: InputDecoration(
            hintText: "Example: yourmail@gmail.com",
            fillColor: MyColors.inputColor,
            filled: true,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 26.0, vertical: 18.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: const BorderSide(color: Colors.transparent, width: 0),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: const BorderSide(color: Colors.transparent, width: 0),
            ),
            focusedBorder: OutlineInputBorder(
              gapPadding: 0.0,
              borderRadius: BorderRadius.circular(8.r),
              borderSide: const BorderSide(color: Colors.transparent, width: 0),
            ),
          ),
        ),
        SizedBox(height: 24.h),
        const Text(
          "Password",
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        SizedBox(height: 5.h),
        TextField(
          controller: _passwordTextController,
          obscureText: true,
          decoration: InputDecoration(
            hintText: "Your Password",
            fillColor: MyColors.inputColor,
            filled: true,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 26.0, vertical: 18.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: const BorderSide(color: Colors.transparent, width: 0),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: const BorderSide(color: Colors.transparent, width: 0),
            ),
            focusedBorder: OutlineInputBorder(
              gapPadding: 0.0,
              borderRadius: BorderRadius.circular(8.r),
              borderSide: const BorderSide(color: Colors.transparent, width: 0),
            ),
          ),
        ),
        SizedBox(
          height: 24.h,
        ),
        Consumer<AuthProvider>(
          builder: (context, authprovider, _) => authprovider.hasError
              ? Center(
                  child: Text(
                    "${authprovider.errorMessage}",
                    style: TextStyle(color: Colors.red),
                  ),
                )
              : Container(),
        ),
        SizedBox(
          height: 24.h,
        ),
        SizedBox(
          width: double.infinity,
          height: 56.h,
          child: ElevatedButton(
            onPressed: () async {
              String email = _emailTextController.text;
              String password = _passwordTextController.text;
              print("Email: $email, password: $password");
              bool isLoggedinSuccess =
                  await Provider.of<AuthProvider>(context, listen: false)
                      .login(email, password);
              if (isLoggedinSuccess) {
                context.goNamed(RouteName.HOME_PAGE);
              }
            },
            style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: MyColors.primaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.r))),
            child: Consumer<AuthProvider>(
              builder: (context, authprovider, _) => authprovider.isLoading
                  ? const CircularProgressIndicator(
                      color: Colors.white,
                    )
                  : Text(
                      "Login",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14.sp),
                    ),
            ),
          ),
        ),
        SizedBox(
          height: 24.h,
        ),
        SizedBox(
          width: double.infinity,
          height: 56.h,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: MyColors.secondaryButtonColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.r))),
            child: Text(
              "Signup",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
            ),
          ),
        )
      ],
    );
  }
}

class _LogoPortion extends StatelessWidget {
  const _LogoPortion({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        "assets/graphics/common/logo.png",
        width: 177.w,
        height: 177.h,
      ),
    );
  }
}

class _LoginSignUpWithAvatar extends StatelessWidget {
  const _LoginSignUpWithAvatar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hello, Welcome 👋",
              style: TextStyle(fontSize: 14.sp),
            ),
            Text(
              "Lets Login or Signup",
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
            )
          ],
        ),
        const CircleAvatar(
          backgroundImage: AssetImage("assets/graphics/common/avatar.png"),
        )
      ],
    );
  }
}
