import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'component/logo.dart';
import 'component/glassmorphism.dart';

class Register extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/fruit-background.png"), fit: BoxFit.cover)
            ),
          ),
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(left: 30, right: 30),
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
                    children: [_card()],
                  ),
                ],
              ),
            ),
          ),
        ],
      )
    );
  }
}

Widget _card() {
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
                  _passwordTF(),
                  SizedBox(height: 20.0, ),
                  _confPasswordTF(),
                ]
                ),
                SizedBox(height: 20,),
                _registerButton(),
                SizedBox(height: 20,),
                _haveAccount(),
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
      const TextField(
        keyboardType: TextInputType.emailAddress,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 5),),
            hintText: "Enter your Email",
            hintStyle: TextStyle(fontWeight: FontWeight.w200, color: Colors.white, fontSize: 14)
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
      const TextField(
        keyboardType: TextInputType.emailAddress,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 5),),
            hintText: "Enter your Username",
            hintStyle: TextStyle(fontWeight: FontWeight.w200, color: Colors.white, fontSize: 14)
        ),
      ),
    ],
  );
}

Widget _passwordTF() {
  return Column(
    children: [
      Container(
        padding: EdgeInsets.only(top:10, bottom: 5),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.only(right: 10),
              child: const Icon(
                CupertinoIcons.padlock,
                color: Colors.white,
              ),
            ),
            const Text(
              'Password',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            )
          ],
        ),
      ),
      const TextField(
        obscureText: true,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 5),),
            hintText: "Enter your Password",
            hintStyle: TextStyle(fontWeight: FontWeight.w200, color: Colors.white, fontSize: 14)
        ),
      ),
    ],
  );
}

Widget _confPasswordTF() {
  return Column(
    children: [
      Container(
        padding: EdgeInsets.only(top:10, bottom: 5),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.only(right: 10),
              child: const Icon(
                CupertinoIcons.padlock,
                color: Colors.white,
              ),
            ),
            const Text(
              'Confirm Password',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            )
          ],
        ),
      ),
      const TextField(
        obscureText: true,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 5),),
            hintText: "Repeat your Password",
            hintStyle: TextStyle(fontWeight: FontWeight.w200, color: Colors.white, fontSize: 14)
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

Widget _haveAccount() {
  return GestureDetector(
    onTap: () {},
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