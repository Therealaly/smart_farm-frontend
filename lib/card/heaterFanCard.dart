import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import '../component/glassmorphism.dart';


class HeaterFanCard extends StatelessWidget {
  final bool heater;
  final bool fan;

  const HeaterFanCard({required this.heater, required this.fan});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        boxShadow: [
          BoxShadow(
            color: Colors.black38.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 7.r,
            offset: Offset(2, 5), // changes position of shadow
          ),
        ],
      ),
      child: Glassmorphism(
        blur: 20,
        opacity: 0.07,
        radius: 8.r,
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.only(
              left: 14.w, right: 14.w, top: 10.h, bottom: 10.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Row(
                  children: [
                    Icon(
                      CupertinoIcons.thermometer_sun,
                      color: Colors.white,
                    ),
                    SizedBox(width: 15.w,),
                    Text(
                      (heater == true) ? 'On' : 'Off',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 40.w,),
              Container(
                child: Row(
                  children: [
                    Icon(
                      CupertinoIcons.thermometer_snowflake,
                      color: Colors.white,
                    ),
                    SizedBox(width: 15.w,),
                    Text(
                      (fan == true) ? 'On' : 'Off',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      )
    );
  }
}