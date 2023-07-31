import 'package:smart_farm/component/userDialog.dart';

import 'component/glassmorphism.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserManagement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(CupertinoIcons.chevron_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text("Back"),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/aurora-background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
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
                            left: 40.w, right: 40.w, top: 30.h, bottom: 30.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'User Management',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 16.sp,
                              ),
                            ),
                            SizedBox(height: 38.h,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Greenhouse Godean',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12.sp,
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
                                          width: 93.w,
                                          height: 18.h,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                '+ Add Member',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 8.sp,
                                                ),
                                              ),
                                            ]
                                          )
                                        )
                                      )
                                    ),
                                    onTap: () {
                                      showDialog(context: context, builder: (BuildContext context){
                                        return UserDialog();
                                      }
                                      );
                                    },
                                  )
                                )
                              ],
                            ),
                            SizedBox(height: 15.h,),
                            Row(
                              children: [
                                // bisa diganti listview
                                Icon(
                                  CupertinoIcons.person,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 10.w,),
                                Text(
                                  'Dummy Name', // diganti data dinamis
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10.sp,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 30.h,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Greenhouse Jakal',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12.sp,
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
                                          width: 93.w,
                                          height: 18.h,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                '+ Add Member',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 8.sp,
                                                ),
                                              ),
                                            ]
                                          )
                                        )
                                      )
                                    ),
                                    onTap: () {
                                      showDialog(context: context, builder: (BuildContext context){
                                        return UserDialog();
                                      }
                                      );
                                    },
                                  )
                                )
                              ],
                            ),
                            SizedBox(height: 15.h,),
                            Row(
                              children: [
                                // bisa diganti listview
                                Icon(
                                  CupertinoIcons.person,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 10.w,),
                                Text(
                                  'Dummy Name', // diganti data dinamis
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10.sp,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 5.h,),
                            Row(
                              children: [
                                // bisa diganti listview
                                Icon(
                                  CupertinoIcons.person,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 10.w,),
                                Text(
                                  'Dummy Name', // diganti data dinamis
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10.sp,
                                  ),
                                ),
                              ],
                            )
                          ],
                        )
                      ),
                    ),
                  ),
                ]
              ),
            ),
          ]
        ),
      ),
    );
  }
}
