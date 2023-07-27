import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import '../component/glassmorphism.dart';
import 'package:smart_farm/component/numberStepper.dart';

class TemperatureCard extends StatefulWidget {
  final String water;
  final String air;

  const TemperatureCard({required this.water, required this.air});

  @override
  _TemperatureCardState createState() => _TemperatureCardState();
}

class _TemperatureCardState extends State<TemperatureCard> {
  @override
  Widget build(BuildContext context) {
    var lowTemp = 0; // disesuaikan, nilai default
    var highTemp = 0;
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
          padding: EdgeInsets.only(left: 14.w, right: 14.w, top: 5.h, bottom: 10.h),
          //width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Temperature",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 12.sp,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        backgroundColor: Colors.transparent,
                        //barrierColor: Colors.transparent,
                        builder: (context) {
                          return ClipRRect(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(30.r),
                            ),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(
                                sigmaX: 20.0,
                                sigmaY: 20.0,
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white12,
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(30.r),
                                  ),
                                  border: Border.all(
                                    color: Colors.white.withOpacity(0.4), // modal bottom sheet border color
                                    width: 1.0, // Border width
                                  ),
                                ),
                                child: DraggableScrollableSheet(
                                  initialChildSize: 0.6,
                                  maxChildSize: 1,
                                  minChildSize: 0.32,
                                  expand: false,
                                  builder: (context, scrollController) {
                                    return SingleChildScrollView(
                                      controller: scrollController,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 37.w),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            SizedBox(height: 10.h),
                                            Container(
                                              width: 58.w,
                                              height: 3.h,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(5.r),
                                                color: Colors.white,
                                              ),
                                            ),
                                            SizedBox(height: 30.h),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  'Set Temperature',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 14.sp,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                Material(
                                                  color: Colors.transparent,
                                                  child: InkWell(
                                                    child: Container(
                                                      child: Glassmorphism(
                                                        blur: 20,
                                                        opacity: 0.1,
                                                        radius: 5.r,
                                                        child: Container(
                                                          width: 60.w,
                                                          height: 30.h,
                                                          child: Row(
                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                            children: [
                                                              Text(
                                                                'Set',
                                                                style: TextStyle(
                                                                  color: Colors.white,
                                                                  fontSize: 12.sp,
                                                                ),
                                                              ),
                                                            ]
                                                          )
                                                        )
                                                      )
                                                    ),
                                                    onTap: () {},
                                                  )
                                                )
                                              ],
                                            ),
                                            SizedBox(height: 20.h,),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  'Lowest Point',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12.sp
                                                  ),
                                                ),
                                                Container(
                                                  child: Glassmorphism(
                                                    blur: 20,
                                                    opacity: 0.1,
                                                    radius: 5.r,
                                                    child: Container(
                                                      width: 117.w,
                                                      height: 30.h,
                                                      child: NumberStepper(
                                                        initialValue: lowTemp, // bisa disesuaikan
                                                        min: 0, // min stepper
                                                        max: 10, // max stepper
                                                        step: 1, // jumlah kelipatan tiap step
                                                        onChanged: (value){
                                                          // bisa disesuaikan utk menampilkan data
                                                          setState(() {
                                                            lowTemp = value;
                                                          });
                                                        },
                                                      ),
                                                    )
                                                  )
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 10.h,),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  'Highest Point',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 12.sp
                                                  ),
                                                ),
                                                Container(
                                                  child: Glassmorphism(
                                                    blur: 20,
                                                    opacity: 0.1,
                                                    radius: 5.r,
                                                    child: Container(
                                                      width: 117.w,
                                                      height: 30.h,
                                                      child: NumberStepper(
                                                        initialValue: highTemp, // bisa disesuaikan
                                                        min: 0, // min stepper
                                                        max: 10, // max stepper
                                                        step: 1, // jumlah kelipatan tiap step
                                                        onChanged: (value){
                                                          // bisa disesuaikan utk menampilkan data
                                                          setState(() {
                                                            highTemp = value;
                                                          });
                                                        },
                                                      ),
                                                    )
                                                  )
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                    icon: Icon(
                      CupertinoIcons.gear,
                      color: Colors.white,
                      size: 20.h,
                    ),
                  )
                ],
              ),
              SizedBox(height: 5.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Water',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: CupertinoColors.systemGrey2,
                        ),
                      ),
                      Text(
                        '${widget.water} °C',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 20.sp,
                        ),
                      )
                    ],
                  ),
                  SizedBox(width: 40.w,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Air',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: CupertinoColors.systemGrey2,
                        ),
                      ),
                      Text(
                        '${widget.air}°C',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 20.sp,
                        ),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      )
    );
  }
}

