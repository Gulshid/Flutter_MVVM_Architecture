import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mvvm_architecture/Resources/Colors.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final bool loading;
  final VoidCallback onpressed;
  RoundButton({
    Key? key,
    required this.title,
    this.loading=false,
    required this.onpressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onpressed,
      child: Container(
        height: 40.h,
        width: 200.w,
        decoration: BoxDecoration(
          color:Colors.green,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Center(child: loading?CircularProgressIndicator(color: Colors.white,): Text(title, style: TextStyle(color: AppColor.whiteColor,fontSize: 20.sp,fontWeight: FontWeight.bold))),
      ),
    );
  }
}
