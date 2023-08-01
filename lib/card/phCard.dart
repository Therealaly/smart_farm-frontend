import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:smart_farm/component/glassButton.dart';
import '../component/glassmorphism.dart';
import 'package:smart_farm/component/numberStepper.dart';

class PhCard extends StatefulWidget {
  final bool phUp;
  final bool phDown;
  final String ph;

  const PhCard({
    required this.phUp,
    required this.phDown,
    required this.ph
  });

  @override
  _PhCardState createState() => _PhCardState();
}

class _PhCardState extends State<PhCard> {
  @override
  Widget build(BuildContext context) {
    var lowPh = 0; // disesuaikan, nilai default
    var highPh = 0;
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'PH (5.60 - 7.50)',
                    style: TextStyle(
                      color: CupertinoColors.systemGrey5,
                      fontSize: 10.sp,
                    ),
                  ),
                  SizedBox(height: 10.h,),
                  Text(
                    widget.ph,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'pH Up',
                    style: TextStyle(
                      color: CupertinoColors.systemGrey5,
                      fontSize: 12.sp,
                    ),
                  ),
                  Text(
                    (widget.phUp == true) ? 'On' : 'Off',
                    style: TextStyle(
                      color: (widget.phUp == true)
                          ? Color.fromRGBO(0, 255, 10, 1)
                          : Color.fromRGBO(255, 0, 0, 1),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 5.h,),
                  Text(
                    'pH Down',
                    style: TextStyle(
                      color: CupertinoColors.systemGrey5,
                      fontSize: 12.sp,
                    ),
                  ),
                  Text(
                    (widget.phDown == true) ? 'On' : 'Off',
                    style: TextStyle(
                      color: (widget.phDown == true)
                          ? Color.fromRGBO(0, 255, 10, 1)
                          : Color.fromRGBO(255, 0, 0, 1),
                      fontSize: 12.sp,
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
                                              'Set pH Settings',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            GlassButton(
                                              width: 60.w,
                                              height: 30.h,
                                              text: 'Set',
                                              fontSize: 12.sp,
                                              onTap: (){},
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 20.h,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Low',
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
                                                    initialValue: lowPh, // bisa disesuaikan
                                                      min: 0, // min stepper
                                                      max: 10, // max stepper
                                                      step: 1, // jumlah kelipatan tiap step
                                                      onChanged: (value){
                                                        // bisa disesuaikan utk menampilkan data
                                                        setState(() {
                                                          lowPh = value;
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
                                              'High',
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
                                                    initialValue: highPh, // bisa disesuaikan
                                                    min: 0, // min stepper
                                                    max: 10, // max stepper
                                                    step: 1, // jumlah kelipatan tiap step
                                                    onChanged: (value){
                                                      // bisa disesuaikan utk menampilkan data
                                                      setState(() {
                                                        highPh = value;
                                                      });
                                                    },
                                                  ),
                                                )
                                              )
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 20.h,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Material(
                                              color: Colors.transparent,
                                              child: InkWell(
                                                child: Container(
                                                  child: Glassmorphism(
                                                    blur: 20,
                                                    opacity: 0.1,
                                                    radius: 5.r,
                                                    child: Container(
                                                      padding: EdgeInsets.only(top: 10.h,
                                                        bottom: 10.h,
                                                        left: 26.w,
                                                        right: 26.w),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                          Text(
                                                            'Calibrate pH 4',
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
                                            ),
                                            SizedBox(width: 20.w,),
                                            Material(
                                              color: Colors.transparent,
                                              child: InkWell(
                                                child: Container(
                                                  child: Glassmorphism(
                                                    blur: 20,
                                                    opacity: 0.1,
                                                    radius: 5.r,
                                                    child: Container(
                                                      padding: EdgeInsets.only(top: 10.h,
                                                        bottom: 10.h,
                                                        left: 26.w,
                                                        right: 26.w),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                          Text(
                                                            'Calibrate pH 7',
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
                                            ),
                                          ],
                                        )
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