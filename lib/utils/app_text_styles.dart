import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyle {
  const AppTextStyle._();

  static final TextStyle semiBoldStyle = _textStyle.copyWith(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
  );

  static final TextStyle boldStyle = _textStyle.copyWith(
    fontSize: 22.sp,
    fontWeight: FontWeight.w700,
  );

  static final TextStyle regularStyle = _textStyle.copyWith(
    fontSize: 18.sp,
    fontWeight: FontWeight.w400,
  );

  static final TextStyle buttonTextStyle = _textStyle.copyWith(
    fontSize: 16.sp,
    fontWeight: FontWeight.w700,
  );

  static final TextStyle _textStyle = TextStyle(
    color: Colors.black,
    fontSize: 14.sp,
  );
}
