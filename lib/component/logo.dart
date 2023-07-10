import 'package:flutter/material.dart';

Widget logo = Container(
  child: Row(
    mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image(
          image: AssetImage('assets/images/SMARTFARM_logo.png'),
          height: 200,
          width: 200,
        ),
      ]
  )
);