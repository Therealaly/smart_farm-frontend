import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_farm/component/glassButton.dart';
import 'package:smart_farm/profile.dart';
import 'package:smart_farm/resetPwd.dart';
import 'package:smart_farm/userManagement.dart';
import 'component/glassmorphism.dart';
import 'signIn.dart';
import 'register.dart';
import 'forgotPwd.dart';
import 'dashboard.dart';
import 'homepage.dart';
import 'component/logo.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context , child) {
        return MaterialApp(
          title: 'OS Smart Farm',
          theme: ThemeData(
              fontFamily: 'SFPro',
          ),
          home:
          Home(),
          routes: {
            '/profile': (context) => Profile(),
            '/user_management': (context) => UserManagement(),
            '/forgot_pwd': (context) => ForgotPwd(),
            '/reset_pwd': (context) => ResetPwd(),
            '/register': (context) => Register(),
            '/homepage': (context) => Homepage(),
            '/signIn': (context) => SignIn(),
          },
        );
      },
      designSize: Size(390, 844),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 33.w, vertical: 90.h),
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/vege-background.png"), fit: BoxFit.cover)
        ),
        child: Column(
          children: [
            Expanded(
                child: titleSection),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                child: _continueButton(context),
              ),
            )
          ],
        ),
      )
    );
}}

Widget titleSection = Container(
  child:
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          logo,
          Container(
            padding: EdgeInsets.only(top: 15),
            child: Text(
              'Simplify Your Melon Farm With Our New Smart Farm App!',
              maxLines: 4,
              style: TextStyle(
                  fontSize: 32.sp,
                  height: 1.2.h,
                  fontFamily: 'SFPro',
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
              ),
            ),
          )
        ],
  ),
);

Widget _continueButton(context) {
  return Material(
    color: Colors.transparent,
    child: InkWell(
      child: Container(
        child: Glassmorphism(
          blur: 20,
          opacity: 0.1,
          radius: 15.r,
          child: Container(
            height: 60.h,
            width: double.infinity,
            //padding: const EdgeInsets.all(5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Continue',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(width: 14.w,),
                Icon(
                  CupertinoIcons.arrow_right,
                  color: Colors.white,
                )
                // const SizedBox(
                //   height: 20,
                // ),
              ]
            )
          )
        )
      ),
      onTap: () {
        Navigator.of(context).pushReplacementNamed('/signIn');
      },
    )
  );
}



