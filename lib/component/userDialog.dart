import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_farm/component/glassButton.dart';
import 'package:smart_farm/component/glassmorphism.dart';
import 'package:share_plus/share_plus.dart';

class UserDialog extends StatelessWidget {
  const UserDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Glassmorphism(
        blur: 10,
        opacity: 0.07,
        radius: 8.r,
        child: Container(
          constraints: BoxConstraints.tightForFinite(),
          child: Padding(
            padding: EdgeInsets.only(top: 20.h, bottom: 20.h, left: 38.w, right: 38.w),
            child: Column(
              mainAxisSize: MainAxisSize.min, // amazing!!, for dialog height wrap content
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Enter email to invite',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    IconButton(
                      onPressed: (){
                        Navigator.of(context).pop();
                      },
                      icon: Icon(
                        CupertinoIcons.xmark,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 24.h,),
                _inviteEmailTF(),
                SizedBox(height: 20.h,),
                GlassButton(
                    width: 248.w,
                    height: 39.h,
                    text: 'Send Invite',
                    fontSize: 12.sp,
                    onTap: () {},
                ),
                SizedBox(height: 25.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          child: Image.asset(
                            'assets/images/whatsapp_logo_white.png',
                            height: 20.h,
                            width: 20.w,
                          ),
                          style: ElevatedButton.styleFrom(
                            shape: CircleBorder(),
                            padding: EdgeInsets.only(top: 10.h, bottom: 10.h, left: 10.w, right: 10.w),
                            backgroundColor: Color.fromRGBO(0, 180, 7, 1),
                          ),
                        ),
                        SizedBox(height: 9.h,),
                        Text(
                          'WhatsApp',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10.sp,
                          ),
                        )
                      ],
                    ),
                    SizedBox(width: 15.w,),
                    Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          child: Image.asset(
                            'assets/images/instagram_logo_white.png',
                            height: 20.h,
                            width: 20.w,
                          ),
                          style: ElevatedButton.styleFrom(
                            shape: CircleBorder(),
                            padding: EdgeInsets.only(top: 10.h, bottom: 10.h, left: 10.w, right: 10.w),
                            backgroundColor: Color.fromRGBO(235, 23, 112, 1),
                          ),
                        ),
                        SizedBox(height: 9.h,),
                        Text(
                          'Instagram',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10.sp,
                          ),
                        )
                      ],
                    ),
                    SizedBox(width: 15.w,),
                    Column(
                      children: [
                        ElevatedButton(
                          onPressed: ()  {
                             Share.share('You have ben invited to join https://youtu.be/u31qwQUeGuM',
                                subject: 'Invitation to join my Greenhouse on SmartFarm');
                            // lihat documentation for share_plus flutter add on
                            // untuk mengubah menjadi API calls
                          },
                          child: Icon(
                            Icons.more_horiz_rounded,
                            color: Colors.white,
                          ),
                          style: ElevatedButton.styleFrom(
                            shape: CircleBorder(),
                            padding: EdgeInsets.only(top: 10.h, bottom: 10.h, left: 10.w, right: 10.w),
                            backgroundColor: Color.fromRGBO(160, 160, 160, 1),
                          ),
                        ),
                        SizedBox(height: 9.h,),
                        Text(
                          'Other',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10.sp,
                          ),
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _inviteEmailTF() {
  return Column(
    children: [
      Row(
        children: [
          const Icon(
            CupertinoIcons.mail,
            color: Colors.white,
          ),
          SizedBox(width: 7.w,),
          Text(
            'Email',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.sp,
            ),
          )
        ],
      ),
      Container(
        height: 33.h,
        child: TextField(
          keyboardType: TextInputType.emailAddress,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 2.w), // Set the borderSide color to white
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white70, width: 2.w), // Set the borderSide color to white
            ),
          ),
        ),
      ),
    ],
  );
}
