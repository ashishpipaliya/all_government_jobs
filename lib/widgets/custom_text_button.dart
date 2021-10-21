import 'package:flutter/material.dart';
import 'package:all_govt_jobs/utils/app_text_styles.dart';
import 'package:all_govt_jobs/utils/utils_main.dart';
import 'package:all_govt_jobs/utils/extension.dart';

class CustomTextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String? title;
  final double height;
  final double? buttonWidth, textFontSize;
  final Widget? child;
  final Color buttonColor;
  final bool addBorder;

  const CustomTextButton({
    Key? key,
    required this.onPressed,
    required this.title,
    this.height = 52,
    this.child,
    this.buttonColor = AppColor.kPrimaryColor,
    this.buttonWidth,
    this.textFontSize,
    this.addBorder = false,
  })  : assert(
          title == null || child == null,
          'Cannot provide both a title and a child\n'
          'To provide both, use "child: Text(title)".',
        ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: AppTheme.theme.textButtonTheme.style!.copyWith(
        minimumSize: MaterialStateProperty.resolveWith<Size>(
          (states) => buttonWidth == null
              ? Size.fromHeight(height.h)
              : Size(
                  buttonWidth!,
                  height.h,
                ),
        ),
        overlayColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) {
              return buttonColor == Colors.transparent ||
                      buttonColor == Colors.white
                  ? AppColor.kPrimaryColor.withOpacity(.24)
                  : Colors.white.withOpacity(.14);
            }

            return null;
          },
        ),
        shape: addBorder
            ? MaterialStateProperty.resolveWith<RoundedRectangleBorder>(
                (states) => RoundedRectangleBorder(
                  borderRadius: 23.borderRadius,
                  side: BorderSide(
                    color: buttonColor == AppColor.kPrimaryColor
                        ? Colors.white
                        : AppColor.kPrimaryColor,
                    width: 2.w,
                  ),
                ),
              )
            : AppTheme.theme.textButtonTheme.style!.shape,
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return AppColor.doveGray;
            }

            return buttonColor;
          },
        ),
      ),
      child: child ??
          Text(
            title!,
            style: AppTextStyle.buttonTextStyle.copyWith(
              fontSize: textFontSize ?? 16.sp,
              color: buttonColor == Colors.white ||
                      buttonColor == Colors.transparent
                  ? AppColor.kPrimaryColor
                  : Colors.white,
            ),
          ),
    );
  }
}
