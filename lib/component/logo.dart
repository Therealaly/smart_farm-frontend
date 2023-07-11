import 'package:flutter/material.dart';

Widget logo = Container(
  child: Row(
    mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image(
          image: AssetImage('assets/images/SMARTFARM_logo.png'),
          height: 150,
          width: 150,
        ),
      ]
  )
);