import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'component/glassButton.dart';
import 'component/glassmorphism.dart';
import 'component/logo.dart';

class ResetPwd extends StatefulWidget {
  @override
  _ResetPwdState createState() => _ResetPwdState();
}

class _ResetPwdState extends State<ResetPwd> with AutomaticKeepAliveClientMixin {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/vege-background.png"),
            fit: BoxFit.cover,
          ),
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
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        _card(
                          newPasswordController,
                          confirmPasswordController,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _card(TextEditingController newPasswordController, TextEditingController confirmPasswordController) {
    return Glassmorphism(
      blur: 20,
      opacity: 0.1,
      radius: 15,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 45.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Set New Password',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 30.h),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      _pwdTF1(newPasswordController),
                      SizedBox(height: 20.h),
                      _pwdTF2(confirmPasswordController, newPasswordController),
                      SizedBox(height: 20.h),
                      Builder(
                        builder: (BuildContext context) {
                          return GlassButton(
                            width: double.infinity,
                            height: 39.h,
                            text: 'Reset Password',
                            fontSize: 12.sp,
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                // Passwords are valid and match, continue with your logic
                                Navigator.of(context).pop();
                              }
                            },
                          );
                        },
                      )
                    ],
                  ),
                )
              ]
            ),
          ]
        )
      )
    );
  }
}

Widget _pwdTF1(newPasswordController) {
  return Column(
    children: [
      Container(
        child: Row(
          children: [
            const Icon(
              CupertinoIcons.padlock,
              color: Colors.white,
            ),
            SizedBox(width: 5.w,),
            Text(
              'New Password',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14.sp,
              ),
            )
          ],
        ),
      ),
      TextFormField(
        controller: newPasswordController,
        keyboardType: TextInputType.visiblePassword,
        style: TextStyle(color: Colors.white),
        obscureText: true,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Password is required';
          } else if (value.length < 6) {
            return 'Password must be at least 6 characters';
          } else if (!RegExp(r'(?=.*[A-Z])(?=.*\d)').hasMatch(value)) {
            return 'Password must contain at least one uppercase letter and one number';
          }
          return null;
        },
        decoration: InputDecoration(
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 2.w),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white70, width: 2.w),
          ),
          hintText: "Enter your password",
          hintStyle: TextStyle(fontWeight: FontWeight.w200, color: Colors.white, fontSize: 10.sp),
        ),
      ),
    ],
  );
}

Widget _pwdTF2(TextEditingController confirmPasswordController, TextEditingController newPasswordController) {
  return Column(
    children: [
      Container(
        child: Row(
          children: [
            const Icon(
              CupertinoIcons.padlock,
              color: Colors.white,
            ),
            SizedBox(width: 5.w,),
            Text(
              'Confirm New Password',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14.sp,
              ),
            )
          ],
        ),
      ),
      TextFormField(
        controller: confirmPasswordController,
        keyboardType: TextInputType.visiblePassword,
        style: TextStyle(color: Colors.white),
        obscureText: true,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please re-enter your password';
          } else if (value != newPasswordController.text) {
            return 'Passwords do not match';
          }
          return null;
        },
        decoration: InputDecoration(
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 2.w),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white70, width: 2.w),
          ),
          hintText: "Repeat your password",
          hintStyle: TextStyle(fontWeight: FontWeight.w200, color: Colors.white, fontSize: 10.sp),
        ),
      ),
    ],
  );
}

