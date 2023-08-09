import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import '../component/glassmorphism.dart';
import 'package:smart_farm/component/numberStepper.dart';

class PumpCard extends StatefulWidget {
  final String duration;
  final String checking;

  const PumpCard({required this.duration, required this.checking});

  @override
  _PumpCardState createState() => _PumpCardState();
}

class _PumpCardState extends State<PumpCard> {
  @override
  Widget build(BuildContext context) {
    var durationTime = 0; //sesuaikan dgn kebutuhan
    var checkTime = 0; //sesuaikan dgn kebutuhan
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
              top: 25.h, right: 12.w, bottom: 25.h, left: 22.w),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Peristaltic Pump',
                    style: TextStyle(
                      color: CupertinoColors.systemGrey5,
                      fontSize: 10.sp,
                    ),
                  ),
                  SizedBox(height: 10.h,),
                  Image(
                    image: AssetImage('assets/images/pump_icon.png'),
                    height: 38.h,
                    width: 34.w,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Dose Time',
                    style: TextStyle(
                      color: CupertinoColors.systemGrey5,
                      fontSize: 11.sp,
                    ),
                  ),
                  Text(
                    '${widget.duration} (minutes)',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 8.h,),
                  Text(
                    'Dose Interval',
                    style: TextStyle(
                      color: CupertinoColors.systemGrey5,
                      fontSize: 11.sp,
                    ),
                  ),
                  Text(
                    '${widget.checking} (seconds)',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              //SizedBox(width: 5,),
              IconButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    backgroundColor: Colors.transparent,
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
                                            Container(
                                              width: 123.w,
                                              height: 35.h,
                                              child: Text(
                                                'Dose Time & Dose Interval',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w600,
                                                ),
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
                                              'Dose Time',
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
                                                    initialValue: durationTime, // bisa disesuaikan
                                                    min: 0, // min stepper
                                                    max: 60, // max stepper
                                                    step: 1, // jumlah kelipatan tiap step
                                                    onChanged: (value){
                                                      // bisa disesuaikan utk menampilkan data
                                                      setState(() {
                                                        durationTime = value;
                                                      });
                                                    },
                                                  ),
                                                )
                                              )
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 5.h,),
                                        Container(
                                          width: double.infinity,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            children: [
                                              Text(
                                                '/sec',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 10.sp,
                                                ),
                                              ),
                                              Text(
                                                'max 60 seconds',
                                                style: TextStyle(
                                                  color: CupertinoColors.systemGrey2,
                                                  fontSize: 10.sp,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 10.h,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Dose Interval',
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
                                                    initialValue: checkTime, // bisa disesuaikan
                                                    min: 0, // min stepper
                                                    max: 60, // max stepper
                                                    step: 1, // jumlah kelipatan tiap step
                                                    onChanged: (value){
                                                      // bisa disesuaikan utk menampilkan data
                                                      setState(() {
                                                        checkTime = value;
                                                      });
                                                    },
                                                  ),
                                                )
                                              )
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 5.h,),
                                        Container(
                                          width: double.infinity,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            children: [
                                              Text(
                                                '/minute',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 10.sp,
                                                ),
                                              ),
                                              Text(
                                                'max 60 minutes',
                                                style: TextStyle(
                                                  color: CupertinoColors.systemGrey2,
                                                  fontSize: 10.sp,
                                                ),
                                              )
                                            ],
                                          ),
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
          )
        ),
      ),
    );
  }
}