import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;
  final Color color;

  CustomButton({
    required this.onPressed,
    required this.buttonText,
    required this.color,// Default to false
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFFFFA500),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 0,
          padding:EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
          textStyle: TextStyle(fontSize: 20.sp),
        ),
        child: Text(
          
          buttonText,
          style: TextStyle(color: color,fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
