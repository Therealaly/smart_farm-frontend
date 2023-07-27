import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import '../component/glassmorphism.dart';
import 'package:smart_farm/component/numberStepper.dart';

class EcCard extends StatefulWidget {
  final bool aNutrition;
  final bool bNutrition;
  final String ec;

  const EcCard(
      {required this.aNutrition, required this.bNutrition, required this.ec});

  @override
  _EcCardState createState() => _EcCardState();
}

class _EcCardState extends State<EcCard> {
  @override
  Widget build(BuildContext context) {
    var allDap = 0; //sesuaikan dgn kebutuhan
    var dapV1 = 0; //sesuaikan dgn kebutuhan
    var dapV2 = 0; //sesuaikan dgn kebutuhan
    var dapV3 = 0; //sesuaikan dgn kebutuhan
    var dapV4 = 0; //sesuaikan dgn kebutuhan
    var dapV5 = 0; //sesuaikan dgn kebutuhan
    var dapV6 = 0; //sesuaikan dgn kebutuhan
    var dapV7 = 0; //sesuaikan dgn kebutuhan
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
                    widget.ec,
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
                    (widget.aNutrition == true) ? 'On' : 'Off',
                    style: TextStyle(
                      color: (widget.aNutrition == true) ? Color.fromRGBO(
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
                    (widget.bNutrition == true) ? 'On' : 'Off',
                    style: TextStyle(
                      color: (widget.bNutrition == true) ? Color.fromRGBO(
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
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
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
                                    SizedBox(height: 10.h),
                                    Expanded(
                                      child: SingleChildScrollView(
                                        controller: scrollController,
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 37.w),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              SizedBox(height: 20.h),
                                              Container(
                                                width: double.infinity,
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Set All DAP',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 14.sp,
                                                        fontWeight: FontWeight.w600,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(height: 22.h,),
                                              Row(
                                                children: [
                                                  Container(
                                                    child: Glassmorphism(
                                                      blur: 20,
                                                      opacity: 0.1,
                                                      radius: 5.r,
                                                      child: Container(
                                                        width: 117.w,
                                                        height: 30.h,
                                                        child: NumberStepper(
                                                          initialValue: allDap, // bisa disesuaikan
                                                          min: 0, // min stepper
                                                          max: 60, // max stepper
                                                          step: 1, // jumlah kelipatan tiap step
                                                          onChanged: (value){
                                                            // bisa disesuaikan utk menampilkan data
                                                            setState(() {
                                                              allDap = value;
                                                            });
                                                          },
                                                        ),
                                                      )
                                                    )
                                                  ),
                                                  SizedBox(width: 7.w,),
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
                                              SizedBox(height: 35.h,),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text(
                                                    'Set Single DAP',
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
                                              SizedBox(height: 15.h,),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text(
                                                    'EC Value DAP 1',
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
                                                          initialValue: dapV1, // bisa disesuaikan
                                                          min: 0, // min stepper
                                                          max: 60, // max stepper
                                                          step: 1, // jumlah kelipatan tiap step
                                                          onChanged: (value){
                                                            // bisa disesuaikan utk menampilkan data
                                                            setState(() {
                                                              dapV1 = value;
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
                                                    'EC Value DAP 2',
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
                                                          initialValue: dapV2, // bisa disesuaikan
                                                          min: 0, // min stepper
                                                          max: 60, // max stepper
                                                          step: 1, // jumlah kelipatan tiap step
                                                          onChanged: (value){
                                                            // bisa disesuaikan utk menampilkan data
                                                            setState(() {
                                                              dapV2 = value;
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
                                                    'EC Value DAP 3',
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
                                                          initialValue: dapV3, // bisa disesuaikan
                                                          min: 0, // min stepper
                                                          max: 60, // max stepper
                                                          step: 1, // jumlah kelipatan tiap step
                                                          onChanged: (value){
                                                            // bisa disesuaikan utk menampilkan data
                                                            setState(() {
                                                              dapV3 = value;
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
                                                    'EC Value DAP 4',
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
                                                          initialValue: dapV4, // bisa disesuaikan
                                                          min: 0, // min stepper
                                                          max: 60, // max stepper
                                                          step: 1, // jumlah kelipatan tiap step
                                                          onChanged: (value){
                                                            // bisa disesuaikan utk menampilkan data
                                                            setState(() {
                                                              dapV4 = value;
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
                                                    'EC Value DAP 5',
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
                                                          initialValue: dapV5, // bisa disesuaikan
                                                          min: 0, // min stepper
                                                          max: 60, // max stepper
                                                          step: 1, // jumlah kelipatan tiap step
                                                          onChanged: (value){
                                                            // bisa disesuaikan utk menampilkan data
                                                            setState(() {
                                                              dapV5 = value;
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
                                                    'EC Value DAP 6',
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
                                                              initialValue: dapV6, // bisa disesuaikan
                                                              min: 0, // min stepper
                                                              max: 60, // max stepper
                                                              step: 1, // jumlah kelipatan tiap step
                                                              onChanged: (value){
                                                                // bisa disesuaikan utk menampilkan data
                                                                setState(() {
                                                                  dapV6 = value;
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
                                                    'EC Value DAP 7',
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
                                                              initialValue: dapV7, // bisa disesuaikan
                                                              min: 0, // min stepper
                                                              max: 60, // max stepper
                                                              step: 1, // jumlah kelipatan tiap step
                                                              onChanged: (value){
                                                                // bisa disesuaikan utk menampilkan data
                                                                setState(() {
                                                                  dapV7 = value;
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
                                                              left: 12.w,
                                                              right: 12.w),
                                                            child: Row(
                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                              children: [
                                                                Text(
                                                                  'Add DAP',
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
                                                              left: 12.w,
                                                              right: 12.w),
                                                            child: Row(
                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                              children: [
                                                                Text(
                                                                  'Delete DAP',
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
                                                              left: 12.w,
                                                              right: 12.w),
                                                            child: Row(
                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                              children: [
                                                                Text(
                                                                  'End DAP',
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
                                              ),
                                              SizedBox(height: 50.h,),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
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