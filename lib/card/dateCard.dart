import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import '../component/glassmorphism.dart';

class DateCard extends StatefulWidget {
  final String dap;
  const DateCard({required this.dap});

  @override
  _DateCardState createState() => _DateCardState();
}

class _DateCardState extends State<DateCard> {
  TextEditingController dateController = TextEditingController();
  bool dapSwitch = false;

  @override
  void initState(){
    super.initState();
    dateController.text = '';
  }

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
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          child: Container(
            child: Glassmorphism(
              blur: 10,
              opacity: 0.07,
              radius: 8.r,
              child: Container(
                padding: EdgeInsets.only(left: 14.w, right: 14.w, top: 10.h, bottom: 10.h),
                width: double.infinity,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'DATETIME',
                          style: TextStyle(
                            fontSize: 10.sp,
                            color: CupertinoColors.systemGrey2,
                          ),
                        ),
                        SizedBox(height: 5.h,),
                        // datetime silahkan diganti sesuai kebutuhan, skrg menunjukan tgl sistem
                        Text(
                          DateFormat.yMMMMd().format(DateTime.now()),
                          style: TextStyle(
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'DAP',
                          style: TextStyle(
                            fontSize: 10.sp,
                            color: CupertinoColors.systemGrey2,
                          ),
                        ),
                        SizedBox(height: 5.h,),
                        Text(
                          widget.dap,
                          style: TextStyle(
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                    Container(
                      width: 83.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'TIME',
                            style: TextStyle(
                              fontSize: 10.sp,
                              color: CupertinoColors.systemGrey2,
                            ),
                          ),
                          SizedBox(height: 5.h,),
                          // datetime silahkan diganti sesuai kebutuhan, skrg menunjukan tgl sistem
                          StreamBuilder(
                            stream: Stream.periodic(const Duration(seconds: 1)),
                            builder: (context, snapshot) {
                              return Text(
                                DateFormat('hh:mm:ss').format(DateTime.now()),
                                style: TextStyle(
                                  fontSize: 17.sp,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    // IconButton(
                    //   onPressed: () {
                    //
                  ],
                ),
              ),
            ),
          ),
          onTap: () {
            showModalBottomSheet(
              context: context,
              backgroundColor: Colors.transparent,
              builder: (context) {
                return StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
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
                              color: Colors.white.withOpacity(0.4),
                              // modal bottom sheet border color
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
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SizedBox(height: 10.h),
                                      Container(
                                        width: double.infinity,
                                        alignment: Alignment.center,
                                        child: Container(
                                          width: 58.w,
                                          height: 3.h,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              5.r),
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 30.h),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment
                                            .spaceBetween,
                                        children: [
                                          Text(
                                            'Setting DAP',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w700,
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
                                                      mainAxisAlignment: MainAxisAlignment
                                                          .center,
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
                                      Container(
                                        width: double.infinity,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment
                                              .start,
                                          children: [
                                            Text(
                                              'Date Time',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            TextField(
                                              style: TextStyle(
                                                  color: Colors.white),
                                              controller: dateController,
                                              //editing controller of this TextField
                                              decoration: const InputDecoration(
                                                icon: Icon(
                                                  Icons.calendar_today),
                                                //icon of text field
                                                labelText: "Enter Date",
                                                labelStyle: TextStyle(
                                                  color: CupertinoColors.systemGrey2),
                                                iconColor: Colors.white,
                                                enabledBorder: UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: CupertinoColors.systemGrey),
                                                ),
                                                focusedBorder: UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Colors.white),
                                                ),
                                                //label text of field
                                              ),
                                              readOnly: true,
                                              // when true user cannot edit text
                                              onTap: () async {
                                                DateTime? pickedDate = await showDatePicker(
                                                  context: context,
                                                  initialDate: DateTime.now(),
                                                  //get today's date
                                                  firstDate: DateTime.now(),
                                                  //DateTime(2000), -> to specify fixed date. DateTime.now() -> not to allow to choose before today.
                                                  lastDate: DateTime(2101),
                                                );
                                                if (pickedDate != null) {
                                                  print(
                                                    pickedDate); //get the picked date in the format
                                                  String formattedDate = DateFormat(
                                                    'dd-MM-yyyy').format(
                                                    pickedDate); // format date in required form here we use dd-MM-yyyy that means time is removed
                                                  print(
                                                    formattedDate); //formatted date output using intl packag
                                                  //You can format date as per your need
                                                  setState(() {
                                                    dateController.text =
                                                      formattedDate; //set foratted date to TextField value.
                                                  });
                                                } else {
                                                  print("Date is not selected");
                                                }
                                              }
                                            )
                                          ],

                                        ),
                                      ),
                                      SizedBox(height: 20.h,),
                                      Text(
                                        'DAP Status',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      SizedBox(height: 5.h,),
                                      Row(
                                        children: [
                                          Container(
                                            width: 35.w,
                                            child: Text(
                                              dapSwitch ? 'On' : 'Off',
                                              style: TextStyle(
                                                fontSize: 12.sp,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 10.w,),
                                          //Switch disambungkan dengan data backend untuk memulai DAP
                                          Switch(
                                            // thumb color (round icon)
                                            activeColor: Colors.white,
                                            activeTrackColor: Colors.green,
                                            inactiveThumbColor: Colors.white,
                                            inactiveTrackColor: Colors.red,
                                            splashRadius: 50.0,
                                            // boolean variable value
                                            value: dapSwitch,
                                            // changes the state of the switch
                                            onChanged: (value) {
                                              setState(() {
                                                dapSwitch = value;
                                                // other tasks
                                              });
                                            },
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
                  }
                );
              },
            );
          },
        ),
      )
    );
  }
}