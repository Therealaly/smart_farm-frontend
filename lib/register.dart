import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_farm/component/glassButton.dart';
import 'component/logo.dart';
import 'component/glassmorphism.dart';

class Register extends StatefulWidget {
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();


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
                    //SizedBox(height: 20,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _card(
                          context,
                          newPasswordController,
                          confirmPasswordController,
                          formKey,
                        )
                      ],
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

Widget _card(context, TextEditingController newPasswordController, TextEditingController confirmPasswordController, formKey) {
  return Row(
    children: [
      Expanded(
        child: Glassmorphism(
          blur: 20,
          opacity: 0.1,
          radius: 15,
          child: Container(
            //height: 150,
            padding: const EdgeInsets.all(40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Create an Account',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 40.0,),
                  _emailTF(),
                  SizedBox(height: 20.0, ),
                  _usernameTF(),
                  SizedBox(height: 20.0, ),
                  Form(
                    key: formKey,
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
                              text: 'Register',
                              fontSize: 12.sp,
                              onTap: () {
                                if (formKey.currentState!.validate()) {
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
                SizedBox(height: 20,),
                _haveAccount(context),
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
        padding: EdgeInsets.only(top:10, bottom: 5),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.only(right: 10),
              child: const Icon(
                CupertinoIcons.mail,
                color: Colors.white,
              ),
            ),
            const Text(
              'Email',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
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
          hintText: "Enter your email",
          hintStyle: TextStyle(fontWeight: FontWeight.w200, color: Colors.white, fontSize: 10.sp),
        ),
      ),
    ],
  );
}

Widget _usernameTF() {
  return Column(
    children: [
      Container(
        padding: EdgeInsets.only(top:10, bottom: 5),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.only(right: 10),
              child: const Icon(
                CupertinoIcons.person,
                color: Colors.white,
              ),
            ),
            const Text(
              'Username',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
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
          hintText: "Enter your username",
          hintStyle: TextStyle(fontWeight: FontWeight.w200, color: Colors.white, fontSize: 10.sp),
        ),
      ),
    ],
  );
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
            return
              'Password must contain at least one uppercase letter and one number';
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

Widget _registerButton() {
  return Material(
    color: Colors.transparent,
    child: InkWell(
      child: Container(
        child: Glassmorphism(
          blur: 20,
          opacity: 0.1,
          radius: 5,
          child: Container(
            height: 45,
            width: double.infinity,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Register',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ]
            )
          )
        )
      ),
      onTap: () {},
    )
  );
}

Widget _haveAccount(context) {
  return GestureDetector(
    onTap: () {
      Navigator.of(context).pop();
    },
    child: RichText(
        text: const TextSpan(
            children: [
              TextSpan(
                  text: 'Already have an account? ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  )
              ),
              TextSpan(
                  text: 'Sign in',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  )
              )
            ]
        )
    ),
  );
}