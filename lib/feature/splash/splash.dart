import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:all_govt_jobs/constants/app_color.dart';
import 'package:all_govt_jobs/constants/app_image.dart';
import 'package:all_govt_jobs/utils/routes/app_pages.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      Get.offAllNamed(Routes.DASHBOARD);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: Center(
        child: AvatarGlow(
          glowColor: AppColor.blueDianne,
          endRadius: 100.0,
          duration: Duration(milliseconds: 2000),
          repeat: true,
          showTwoGlows: true,
          repeatPauseDuration: Duration(milliseconds: 100),
          child: CircleAvatar(
            backgroundColor: Colors.grey[100],
            child: Image.asset(
              AppImage.appLogo,
            ),
            radius: 60.0,
          ),
        ),
      ),
    );
  }
}
