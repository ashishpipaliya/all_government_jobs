import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:all_govt_jobs/utils/app_text_styles.dart';
import 'package:all_govt_jobs/utils/utils_main.dart';
import 'package:all_govt_jobs/widgets/custom_text_button.dart';

class Utils {
  const Utils._();

// Dialog
  static void loadingDialog() {
    Utils.closeDialog();

    Get.defaultDialog(
      title: 'Loading..',
      content: const Center(
        child: SpinKitSpinningLines(
          color: AppColor.blueDianne,
        ),
      ),
      onWillPop: () async => false,
      barrierDismissible: false,
    );
  }

  static void closeDialog() {
    if (Get.isDialogOpen!) {
      Get.back();
    }
  }

// Snackbar
  static void showSnackBar(String? message) {
    closeSnackBar();
    Get.rawSnackbar(message: message);
  }

  static void closeSnackBar() {
    if (Get.isSnackbarOpen!) {
      Get.back();
    }
  }

  // unfocus keyboard
  static void closeKeyboard() {
    final currentFocus = Get.focusScope!;
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

// Icon Dialog
  static void showIconDialog(
    String title,
    String message, {
    Widget? imageWidget,
    VoidCallback? onTap,
  }) =>
      Get.dialog(
        AlertDialog(
          title:
              imageWidget ?? const Icon(Icons.done), //add your icon/image here
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: AppTextStyle.semiBoldStyle.copyWith(
                  color: Colors.black,
                  fontSize: 25.sp,
                ),
              ),
              SizedBox(height: 10.w),
              Text(message,
                  textAlign: TextAlign.center,
                  style: AppTextStyle.regularStyle.copyWith(
                    color: AppColor.mineShaft,
                    fontSize: 16.sp,
                  )),
              SizedBox(height: 20.w),
              CustomTextButton(
                title: Strings.ok,
                onPressed: () {
                  Get.back();
                  onTap?.call();
                },
              ),
            ],
          ),
        ),
        barrierDismissible: false,
      );

  /// timepicker
// static void timePicker(
//     Function(String time) onSelectTime, {
//       TimeOfDay? initialTime,
//     }) {
//   showTimePicker(
//     context: Get.overlayContext!,
//     initialTime: initialTime ??
//         TimeOfDay.fromDateTime(
//           DateTime.now(),
//         ),
//   ).then((v) {
//     if (v != null) {
//       final _now = DateTime.now();
//       final _dateTime = DateTime(
//         _now.year,
//         _now.month,
//         _now.day,
//         v.hour,
//         v.minute,
//       );
//
//       onSelectTime(_dateTime.formatedDate(dateFormat: 'hh:mm aa'));
//     }
//   });
// }

}
