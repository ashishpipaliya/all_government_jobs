import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:all_govt_jobs/constants/app_color.dart';
import 'package:all_govt_jobs/constants/app_strings.dart';
import 'package:all_govt_jobs/feature/google_ads/ad_controller.dart';
import 'package:all_govt_jobs/feature/job_details/job_details_controller.dart';
import 'package:all_govt_jobs/feature/job_details/related_job_data_model.dart';
import 'package:all_govt_jobs/services/model/job_data_model.dart';
import 'package:all_govt_jobs/services/model/sub_post_model.dart';
import 'package:all_govt_jobs/utils/app_text_styles.dart';
import 'package:all_govt_jobs/utils/routes/app_pages.dart';
import 'package:all_govt_jobs/widgets/custom_text_button.dart';

class JobDetailsView extends StatefulWidget {
  @override
  _JobDetailsViewState createState() => _JobDetailsViewState();
}

class _JobDetailsViewState extends State<JobDetailsView> {
  JobDetailsController controller = Get.find<JobDetailsController>();
  AdController adController = Get.find<AdController>();

  JobDataModel jobData = Get.arguments;

  @override
  void initState() {
    controller.postID.value = jobData.postID!;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(Strings.appName)),
      body: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20.h),
              margin: EdgeInsets.all(10.h),
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColor.justGrayLight,
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: Text(
                jobData.postName!,
                style: AppTextStyle.boldStyle,
                maxLines: 3,
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: Obx(() {
                int listLength = controller.subPostList.length;
                if (controller.subPostList.isEmpty) {
                  return Center(
                      child: Text(Strings.noDataFound,
                          style: AppTextStyle.boldStyle));
                }
                return ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: listLength + 1,
                  itemBuilder: (context, index) {
                    if (index == listLength + 1) {
                      return SizedBox.shrink();
                      // return Obx(() {
                      //   //TODO: implement ads
                      //   return Container();
                      //   // return Visibility(
                      //     // visible: adController.isBannerAdReady.value,
                      //     // child: Align(
                      //     //   alignment: Alignment.bottomCenter,
                      //     //   child: Container(
                      //     //     width: adController.bannerAd.size.width.toDouble(),
                      //     //     height: adController.bannerAd.size.height.toDouble(),
                      //     //     child: AdWidget(ad: adController.bannerAd2),
                      //     //   ),
                      //     // ),
                      //   // );
                      // });
                    }
                    listLength = listLength - 1;
                    SubPostModel singleSubPost = controller.subPostList[index];
                    return SubPostListWidget(
                        onTap: () =>
                            _handleHowToApplyEvent(singleSubPost.postLink),
                        data: singleSubPost,
                        lastDate: jobData.lastDate!);
                  },
                );
              }),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                Strings.mostPopularPosts,
                style: AppTextStyle.buttonTextStyle.copyWith(
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            SizedBox(height: 5.h),
            Container(
              constraints: BoxConstraints(maxHeight: 100.h),
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Obx(() {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.relatedJobList.length,
                  itemBuilder: (context, index) {
                    RelatedJobDataModel singleJob =
                        controller.relatedJobList[index];

                    return RelatedPostsWidget(
                        onTap: () => _handleHowToApplyEvent(singleJob.postLink),
                        related: singleJob);
                  },
                );
              }),
            ),
            // TODO implement ads
            // Obx(() {
            //   return Visibility(
            //     visible: adController.isBannerAdReady.value,
            //     child: Align(
            //       alignment: Alignment.bottomCenter,
            //       child: Container(
            //         width: adController.bannerAd.size.width.toDouble(),
            //         height: adController.bannerAd.size.height.toDouble(),
            //         child: AdWidget(ad: adController.bannerAd),
            //       ),
            //     ),
            //   );
            // }),
          ],
        ),
      ),
    );
  }

  _handleHowToApplyEvent(dynamic postData) async {
    Get.toNamed(Routes.WEBVIEW, arguments: postData);
  }
}

class SubPostListWidget extends StatelessWidget {
  final SubPostModel? data;
  final String? lastDate;
  final void Function() onTap;

  const SubPostListWidget(
      {Key? key, this.data, this.lastDate, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.h),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColor.justGraSemiLight,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Column(
        children: [
          ListTile(
            visualDensity: VisualDensity.compact,
            title: Text(data!.subpostName!),
          ),
          ListTile(
            visualDensity: VisualDensity.compact,
            title: Text(Strings.salary),
            subtitle: Text(data!.salary!),
          ),
          ListTile(
            visualDensity: VisualDensity.compact,
            title: Text(Strings.qualification),
            subtitle: Text(data!.qualification ?? ''),
          ),
          ListTile(
            visualDensity: VisualDensity.compact,
            title: Text(Strings.ageLimit),
            subtitle: Text(data!.ageLimit ?? ''),
          ),
          ListTile(
            title: Text(Strings.lastDate),
            subtitle: Text(lastDate!),
          ),
          CustomTextButton(onPressed: onTap, title: Strings.howToApply)
        ],
      ),
    );
  }
}

class RelatedPostsWidget extends StatelessWidget {
  final RelatedJobDataModel? related;
  final Function() onTap;

  const RelatedPostsWidget({Key? key, this.related, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 160.w,
        padding: EdgeInsets.only(left: 10.r, right: 10.r, top: 10.r),
        margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          color: AppColor.appColors[Random().nextInt(AppColor.appColors.length)]
              .withOpacity(0.3),
        ),
        child: Text(
          related!.postName!,
          textAlign: TextAlign.start,
          maxLines: 5,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyle.buttonTextStyle.copyWith(fontSize: 12),
        ),
      ),
    );
  }
}
