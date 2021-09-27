import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CustomButton extends StatefulWidget {
 final String ?name;
 final double ? height;
 final Color ?color;
  CustomButton({this.name,this.height,this.color});
  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 90.sp),
      child:Container(
        child: Center(
          child: Text(widget.name!,style: TextStyle(
              color: Colors.white,fontSize: 20.sp),),
        ),
        height: widget.height!,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.sp),
          color: widget.color,
        ),
      ),

    );
  }
}
