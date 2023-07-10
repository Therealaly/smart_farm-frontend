import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'component/glassmorphism.dart';
import 'signIn.dart';
import 'component/logo.dart';

void main() => runApp(MaterialApp(
  theme: ThemeData(fontFamily: 'SFPro'),
  home: SignIn(),


));

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 30, top: 40.0, right: 30, bottom: 0),
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/fruit-background.png"), fit: BoxFit.cover)
        ),
        child: Column(
          children: [
            Expanded(
                child: titleSection),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.only(bottom: 70),
                child: _continueButton,
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
                  fontSize: 36,
                  height: 1.2,
                  fontFamily: 'SFPro',
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
              ),
            ),
          )
        ],
  ),
);

Widget _continueButton = Material(
  color: Colors.transparent,
  child: InkWell(
    child: Container(
        child: Glassmorphism(
            blur: 20,
            opacity: 0.1,
            radius: 15,
            child: Container(
                height: 60,
                //padding: const EdgeInsets.all(5),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Continue',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 15),
                        child: Icon(
                          CupertinoIcons.arrow_right,
                          color: Colors.white,
                        ),
                      )
                      // const SizedBox(
                      //   height: 20,
                      // ),
                    ]
                )
            )
        )
    ),
    onTap: () {},
  )
);



