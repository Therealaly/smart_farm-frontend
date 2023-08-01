import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_farm/component/glassButton.dart';
import 'component/logo.dart';
import 'component/glassmorphism.dart';

class ForgotPwd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/vege-background.png"), fit: BoxFit.cover)
        ),
        child: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                color: Colors.transparent,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: double.infinity,
                      child: logo,
                    ),
                    SizedBox(height: 180.h,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [_card(context)],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}

Widget _card(context) {
  return Row(
    children: [
      Expanded(
        child: Glassmorphism(
          blur: 20,
          opacity: 0.1,
          radius: 15,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 50.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Forget Password?',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 40.h,),
                    _emailTF(),
                  ]
                ),
                SizedBox(height: 30.h,),
                GlassButton(
                  width: double.infinity,
                  height: 39.h,
                  text: 'Send Verification Email',
                  fontSize: 12.sp,
                  onTap: () {
                    Navigator.of(context).pushReplacementNamed('/reset_pwd');
                  },
                )
              ]
            )
          )
        )
      )
    ]
  );
}

Widget _emailTF() {
  return Column(
    children: [
      Container(
        child: Row(
          children: [
            const Icon(
              CupertinoIcons.mail,
              color: Colors.white,
            ),
            SizedBox(width: 5.w,),
            Text(
              'Email',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14.sp,
              ),
            )
          ],
        ),
      ),
      TextField(
        keyboardType: TextInputType.emailAddress,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 2.w), // Set the borderSide color to white
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white70, width: 2.w), // Set the borderSide color to white
          ),
          hintText: "Enter your Email",
          hintStyle: TextStyle(fontWeight: FontWeight.w200, color: Colors.white, fontSize: 10.sp)
        ),
      ),
    ],
  );
}