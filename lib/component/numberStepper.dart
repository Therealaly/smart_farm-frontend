import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NumberStepper extends  StatefulWidget {
  final int initialValue;
  final int min;
  final int max;
  final int step;

  final Function(int) onChanged;

  const NumberStepper({
    super.key,
    required this.initialValue,
    required this.min,
    required this.max,
    required this.step,
    required this.onChanged
  });

  @override
  State<NumberStepper> createState() => _NumberStepperState();
}

class _NumberStepperState extends State<NumberStepper> {
  int _currentValue = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _currentValue = widget.initialValue;
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 5.w,),
          child: IconButton(onPressed: (){
            setState(() {
              if(_currentValue > widget.min){
                _currentValue -= widget.step;
              }
              widget.onChanged (_currentValue);
            });
          }, icon: Icon(CupertinoIcons.minus,color: Colors.white, size: 15.h,)),
        ),
        Text(
          _currentValue.toString(),
          style: TextStyle(
            color: Colors.white,
            fontSize: 14.sp,
          ),
        ),
        Container(
          child: IconButton(onPressed: (){
            setState(() {
              if(_currentValue < widget.max){
                _currentValue += widget.step;
              }
              widget.onChanged (_currentValue);
            });
          }, icon: Icon(CupertinoIcons.add,color: Colors.white, size: 15.h,)),
        ),
      ],
    );
  }
}