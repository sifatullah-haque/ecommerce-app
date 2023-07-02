import 'package:ecom/core/constains/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        child: Column(
          children: [
            _LoginSignUpWithAvatar(),
            _LogoPortion(),
            _LoginSignUpForm()
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Email",
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        SizedBox(height: 5.h),
        TextField(
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
        SizedBox(
          width: double.infinity,
          height: 56.h,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: MyColors.primaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.r))),
            child: Text(
              "Login",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
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
