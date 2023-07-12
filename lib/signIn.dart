import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'component/logo.dart';
import 'component/glassmorphism.dart';

class SignIn extends StatelessWidget {
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
                  SizedBox(height: 40,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [card],
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

Widget card = Row(
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
                    'Welcome to SmartFarm!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 40.0,),
                  _emailTF(),
                  SizedBox(height: 20.0, ),
                  _passwordTF(),
                  SizedBox(height: 20,),
                  Container(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {  },
                      child: const Text(
                        'Forgot Password?',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                    )
                  ),
                ],
              ),
              SizedBox(height: 20,),
              _loginButton(),
              _googleSignIn(),
              SizedBox(height: 20,),
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

Widget _googleSignIn() {
  return Container(
    padding: EdgeInsets.only(top: 10),
    width: double.infinity,
    height: 60,
    child: ElevatedButton.icon(
      onPressed: (){},
      label: const Text(
        'Sign in With Google',
        style: TextStyle(
            fontSize: 16,
            color: Colors.black
        ),
      ),
      icon: Image.asset(
        'assets/images/google_logo.png',
        height: 32,
        width: 32,
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
        text: const TextSpan(
            children: [
              TextSpan(
                  text: 'Don\'t have an account? ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  )
              ),
              TextSpan(
                  text: 'Sign Up',
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

Widget _loginButton() {
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
                            'Login',
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

