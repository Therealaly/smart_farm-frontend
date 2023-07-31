import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'component/logo.dart';
import 'component/glassmorphism.dart';

class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/fruit-background.png"), fit: BoxFit.cover)
        ),
        child: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(left: 30.w, right: 30.w),
                color: Colors.transparent,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: double.infinity,
                      child: logo,
                    ),
                    SizedBox(height: 40.h,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        card
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

Widget card = Row(
  children: [
    Expanded(
      child: Glassmorphism(
        blur: 20,
        opacity: 0.1,
        radius: 15,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 40.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome to SmartFarm!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 40.h,),
                  _emailTF(),
                  SizedBox(height: 20.h, ),
                  _passwordTF(),
                  SizedBox(height: 20.h,),
                  Container(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        //Navigator.pushNamed(context, '/forgot_pwd');
                      },
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          fontSize: 10.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                    )
                  ),
                ],
              ),
              SizedBox(height: 20.h,),
              _loginButton(),
              SizedBox(height: 5.h,),
              _googleSignIn(),
              SizedBox(height: 20.h,),
              _registerAccount(),
            ]
          )
        )
      )
    )
  ]
);

Widget _emailTF() {
  return Column(
    children: [
      Row(
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

Widget _passwordTF() {
  return Column(
    children: [
      Row(
        children: [
          const Icon(
            CupertinoIcons.padlock,
            color: Colors.white,
          ),
          SizedBox(width: 5.w,),
          Text(
            'Password',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.sp,
            ),
          )
        ],
      ),
      TextField(
        obscureText: true,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 2.w), // Set the borderSide color to white
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white70, width: 2.w), // Set the borderSide color to white
            ),
            hintText: "Enter your Password",
            hintStyle: TextStyle(fontWeight: FontWeight.w200, color: Colors.white, fontSize: 10.sp)
        ),
      ),
    ],
  );
}

Widget _googleSignIn() {
  return Container(
    width: double.infinity,
    height: 39.h,
    child: ElevatedButton.icon(
      onPressed: (){},
      label: Text(
        'Sign in With Google',
        style: TextStyle(
            fontSize: 12.sp,
            color: Colors.black
        ),
      ),
      icon: Image.asset(
        'assets/images/google_logo.png',
        height: 20.h,
        width: 20.w,
      ),
      style: const ButtonStyle(
        backgroundColor: MaterialStatePropertyAll<Color>(Colors.white),
      ),
    ),
  );
}

Widget _registerAccount() {
  return GestureDetector(
    onTap: () {},
    child: RichText(
        text: TextSpan(
            children: [
              TextSpan(
                  text: 'Don\'t have an account? ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10.sp,
                  )
              ),
              TextSpan(
                  text: 'Sign Up',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w700,
                  )
              )
            ]
        )
    ),
  );
}

Widget _loginButton() {
  return Material(
      color: Colors.transparent,
      child: InkWell(
        child: Container(
            child: Glassmorphism(
                blur: 20,
                opacity: 0.1,
                radius: 5.r,
                child: Container(
                    width: double.infinity,
                    height: 39.h,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min, // test
                        children: [
                          Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.sp,
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

