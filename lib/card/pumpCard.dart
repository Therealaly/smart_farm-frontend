import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import '../component/glassmorphism.dart';

class PumpCard extends StatelessWidget {
  final String duration;
  final String checking;

  const PumpCard({required this.duration, required this.checking});

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
                    'Duration',
                    style: TextStyle(
                      color: CupertinoColors.systemGrey5,
                      fontSize: 11.sp,
                    ),
                  ),
                  Text(
                    '$duration (minutes)',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 8.h,),
                  Text(
                    'Checking Period',
                    style: TextStyle(
                      color: CupertinoColors.systemGrey5,
                      fontSize: 11.sp,
                    ),
                  ),
                  Text(
                    '$checking (seconds)',
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