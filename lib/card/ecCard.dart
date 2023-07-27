import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import '../component/glassmorphism.dart';

class EcCard extends StatelessWidget {
  final bool aNutrition;
  final bool bNutrition;
  final String ec;

  const EcCard(
      {required this.aNutrition, required this.bNutrition, required this.ec});

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
            offset: Offset(3, 6), // changes position of shadow
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
                    'EC (2.56)',
                    style: TextStyle(
                      color: CupertinoColors.systemGrey5,
                      fontSize: 10.sp,
                    ),
                  ),
                  SizedBox(height: 7.h,),
                  Text(
                    ec,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 10.h,),
                  // Calibrate Button
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      child: Container(
                        child: Glassmorphism(
                          blur: 20,
                          opacity: 0.1,
                          radius: 5.r,
                          child: Container(
                          // height: 30,
                          // width: 100,
                            padding: EdgeInsets.only(top: 9.h,
                              bottom: 9.h,
                              left: 25.w,
                              right: 25.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Calibrate',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10.sp,
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
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'A. Nutrition',
                    style: TextStyle(
                      color: CupertinoColors.systemGrey5,
                      fontSize: 12.sp,
                    ),
                  ),
                  Text(
                    (aNutrition == true) ? 'On' : 'Off',
                    style: TextStyle(
                      color: (aNutrition == true) ? Color.fromRGBO(
                          0, 255, 10, 1) : Color.fromRGBO(255, 0, 0, 1),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 12.h,),
                  Text(
                    'B. Nutrition',
                    style: TextStyle(
                      color: CupertinoColors.systemGrey5,
                      fontSize: 12.sp,
                    ),
                  ),
                  Text(
                    (bNutrition == true) ? 'On' : 'Off',
                    style: TextStyle(
                      color: (bNutrition == true) ? Color.fromRGBO(
                          0, 255, 10, 1) : Color.fromRGBO(255, 0, 0, 1),
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
                    barrierColor: Colors.transparent,
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
                              expand: false,
                              builder: (context, scrollController) {
                                return SingleChildScrollView(
                                  controller: scrollController,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      SizedBox(height: 10.h),
                                      Container(
                                        width: 58.w,
                                        height: 3.h,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5.r),
                                          color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(height: 10.h),
                                      ListTile(
                                        leading: new Icon(Icons.photo),
                                        title: new Text('Photo'),
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                      ),
                                      ListTile(
                                        leading: new Icon(Icons.music_note),
                                        title: new Text('Music'),
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ],
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