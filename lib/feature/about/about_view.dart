import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:all_govt_jobs/constants/app_color.dart';
import 'package:all_govt_jobs/constants/app_image.dart';
import 'package:all_govt_jobs/constants/app_strings.dart';
import 'package:all_govt_jobs/feature/google_ads/ad_controller.dart';
import 'package:all_govt_jobs/utils/app_text_styles.dart';
import 'package:all_govt_jobs/widgets/custom_text_button.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutView extends StatefulWidget {
  @override
  _AboutViewState createState() => _AboutViewState();
}

class _AboutViewState extends State<AboutView> {
  AdController adController = Get.find<AdController>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(Strings.aboutUs)),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: SettingsSection(
                titlePadding: EdgeInsets.all(10.h),
                subtitlePadding: EdgeInsets.all(20.h),
                titleTextStyle: AppTextStyle.buttonTextStyle
                    .copyWith(color: AppColor.blueDianne),
                title: Strings.misc,
                tiles: [
                  SettingsTile(
                    title: Strings.privacyPolicy,
                    onPressed: (context) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            contentPadding:
                                EdgeInsets.only(left: 25.w, right: 25.w),
                            title: Center(child: Text(Strings.privacyPolicy)),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.r))),
                            content: Container(
                              height: 400.h,
                              child: SingleChildScrollView(
                                physics: BouncingScrollPhysics(),
                                child: Text(Strings.privacyPolicyMessage),
                              ),
                            ),
                            actions: [
                              CustomTextButton(
                                onPressed: () {
                                  Get.back();
                                },
                                title: Strings.ok,
                              )
                            ],
                          );
                        },
                      );
                    },
                  ),
                  SettingsTile(
                    title: Strings.termsAndCondition,
                    onPressed: (context) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            contentPadding:
                                EdgeInsets.only(left: 25.w, right: 25.w),
                            title:
                                Center(child: Text(Strings.termsAndCondition)),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.r))),
                            content: Container(
                              height: 400.h,
                              child: SingleChildScrollView(
                                physics: BouncingScrollPhysics(),
                                child: Text(Strings.termsAndConditionMessage),
                              ),
                            ),
                            actions: [
                              CustomTextButton(
                                onPressed: () {
                                  Get.back();
                                },
                                title: Strings.ok,
                              )
                            ],
                          );
                        },
                      );
                    },
                  ),
                  SettingsTile(
                    title: Strings.moreInfo,
                    onPressed: (context) {
                      showAboutDialog(
                          context: context,
                          applicationIcon: Image.asset(
                            AppImage.latestJobs,
                            width: 70.w,
                            height: 70.h,
                          ),
                          applicationName: Strings.appName);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
