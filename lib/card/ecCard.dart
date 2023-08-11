import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:smart_farm/component/glassButton.dart';
import '../component/glassmorphism.dart';
import 'package:smart_farm/component/numberStepper.dart';
import '../models/ecTemplate.dart';

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
  Template? selectedTemplate;
  List<ListViewItem> currentListViewItems = [];

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
                                color: Colors.white.withOpacity(0.4),
                                width: 1.0,
                              ),
                            ),
                            child: DraggableScrollableSheet(
                              initialChildSize: 1,
                              maxChildSize: 1,
                              expand: true,
                              builder: (context, scrollController) {
                                return Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 37.w),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 10.h),
                                      Container(
                                        width: double.infinity,
                                        alignment: Alignment.center,
                                        child: Container(
                                          width: 58.w,
                                          height: 3.h,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(5.r),
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 30.h),
                                      Text(
                                        'EC Template',
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      SizedBox(height: 20.h,),
                                      DropdownButton<Template>(
                                        dropdownColor: Colors.blueGrey[800],
                                        style: TextStyle(color: Colors.white),
                                        value: selectedTemplate,
                                        hint: Text('Select a template', style: TextStyle(color: Colors.white),),
                                        icon: Icon(
                                          Icons.arrow_drop_down,
                                          color: Colors.white,
                                        ),
                                        underline: Container(
                                          height: 1,
                                          color: Colors.white,
                                        ),
                                        onChanged: (newValue) {
                                          setState(() {
                                            selectedTemplate = newValue;
                                            currentListViewItems = listViewItems[selectedTemplate] ?? [];
                                          });
                                        },
                                        items: templates.map((template) {
                                          return DropdownMenuItem<Template>(
                                            value: template,
                                            child: Text(template.name),
                                          );
                                        }).toList(),
                                      ),
                                      Expanded(
                                        child: ListView.builder(
                                          itemCount: currentListViewItems.length,
                                          itemBuilder: (context, index) {
                                            return ListTile(
                                              title: Text(currentListViewItems[index].template.name),
                                              subtitle: Text('EC Value: ${currentListViewItems[index].ecValue}'),
                                            );
                                          },
                                        ),
                                      ),
                                      SizedBox(height: 10.h,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          GlassButton(
                                            width: 83.w,
                                            height: 30.h,
                                            text: 'Add DAP',
                                            fontSize: 12.sp,
                                            onTap: () {}
                                          ),
                                          SizedBox(width: 20.w,),
                                          GlassButton(
                                              width: 95.w,
                                              height: 30.h,
                                              text: 'Delete DAP',
                                              fontSize: 12.sp,
                                              onTap: () {}
                                          ),
                                          SizedBox(width: 20.w,),
                                          GlassButton(
                                              width: 83.w,
                                              height: 30.h,
                                              text: 'End DAP',
                                              fontSize: 12.sp,
                                              onTap: () {}
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 50.h,)
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
              ),

              // IconButton(
              //   onPressed: () {
              //     showModalBottomSheet(
              //       context: context,
              //       backgroundColor: Colors.transparent,
              //       builder: (context) {
              //         return ClipRRect(
              //           borderRadius: BorderRadius.vertical(
              //             top: Radius.circular(30.r),
              //           ),
              //           child: BackdropFilter(
              //             filter: ImageFilter.blur(
              //               sigmaX: 20.0,
              //               sigmaY: 20.0,
              //             ),
              //             child: Container(
              //               decoration: BoxDecoration(
              //                 color: Colors.white12,
              //                 borderRadius: BorderRadius.vertical(
              //                   top: Radius.circular(30.r),
              //                 ),
              //                 border: Border.all(
              //                   color: Colors.white.withOpacity(0.4), // modal bottom sheet border color
              //                   width: 1.0, // Border width
              //                 ),
              //               ),
              //               child: DraggableScrollableSheet(
              //                 initialChildSize: 0.6,
              //                 maxChildSize: 1,
              //                 minChildSize: 0.32,
              //                 expand: false,
              //                 builder: (context, scrollController) {
              //                   return Column(
              //                     crossAxisAlignment: CrossAxisAlignment.center,
              //                     children: [
              //                       SizedBox(height: 10.h),
              //                       Container(
              //                         width: 58.w,
              //                         height: 3.h,
              //                         decoration: BoxDecoration(
              //                           borderRadius: BorderRadius.circular(5.r),
              //                           color: Colors.white,
              //                         ),
              //                       ),
              //                       SizedBox(height: 10.h),
              //                       Expanded(
              //                         child: SingleChildScrollView(
              //                           controller: scrollController,
              //                           child: Padding(
              //                             padding: EdgeInsets.symmetric(horizontal: 37.w),
              //                             child: Column(
              //                               crossAxisAlignment: CrossAxisAlignment.center,
              //                               mainAxisSize: MainAxisSize.min,
              //                               children: [
              //                                 SizedBox(height: 20.h,),
              //                                 DropdownButton<Template>(
              //
              //                                 ),
              //                                 Expanded(
              //                                   child: ListView.builder(
              //                                     itemCount: currentListViewItems.length,
              //                                     itemBuilder: (context, index) {
              //                                       return ListTile(
              //
              //                                       );
              //                                     },
              //                                   ),
              //                                 ),
              //                               ],
              //                             ),
              //                           ),
              //                         ),
              //                       ),
              //                     ],
              //                   );
              //                 },
              //               ),
              //             ),
              //           ),
              //         );
              //       },
              //     );
              //   },
              //   icon: Icon(
              //     CupertinoIcons.gear,
              //     color: Colors.white,
              //     size: 20.h,
              //   ),
              // )
            ],
          )
        ),
      ),
    );
  }
}