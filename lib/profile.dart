import 'component/glassmorphism.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
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
      body: Stack(
        children: <Widget>[
          Container(
          width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/aurora-background.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
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
                            'Your Profile',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 16.sp,
                            ),
                          ),
                          SizedBox(height: 38.h,),
                          Row(
                            children: [
                              Icon(
                                CupertinoIcons.mail,
                                color: Colors.white,
                              ),
                              SizedBox(width: 10.w,),
                              Text(
                                'Email',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 15.h,),
                          Text(
                            'dummy@gmail.com', // diganti data dinamis
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.sp,
                            ),
                          ),
                          SizedBox(height: 30.h,),
                          Row(
                            children: [
                              Icon(
                                CupertinoIcons.person,
                                color: Colors.white,
                              ),
                              SizedBox(width: 10.w,),
                              Text(
                                'Display Name',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 15.h,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Dummy Name', // diganti data dinamis
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.sp,
                                ),
                              ),
                              IconButton(
                                onPressed: (){},
                                icon: Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                )
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
    );
  }
}
