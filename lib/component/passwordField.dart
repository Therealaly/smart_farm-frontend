import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PasswordTextField extends StatefulWidget {
  @override
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Icon(
              CupertinoIcons.padlock,
              color: Colors.white,
            ),
            SizedBox(width: 5.w,),
            Text(
              'Password',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14.sp,
              ),
            )
          ],
        ),
        TextFormField(
          obscureText: !_isPasswordVisible,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 2.w), // Set the borderSide color to white
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white70, width: 2.w), // Set the borderSide color to white
            ),
            hintText: "Enter your password",
            hintStyle: TextStyle(fontWeight: FontWeight.w200, color: Colors.white, fontSize: 10.sp),
            suffixIcon: IconButton(
              icon: Icon(
                _isPasswordVisible ? CupertinoIcons.eye : CupertinoIcons.eye_slash,
                color: Colors.white,

              ),
              onPressed: () {
                setState(() {
                  _isPasswordVisible = !_isPasswordVisible;
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}
