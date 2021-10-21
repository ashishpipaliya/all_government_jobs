import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:all_govt_jobs/constants/app_color.dart';
import 'package:all_govt_jobs/constants/app_strings.dart';
import 'package:all_govt_jobs/feature/google_ads/ad_controller.dart';
import 'package:all_govt_jobs/feature/job_list/job_list_controller.dart';
import 'package:all_govt_jobs/services/model/categories_model.dart';
import 'package:all_govt_jobs/services/model/job_data_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:all_govt_jobs/utils/app_text_styles.dart';
import 'package:all_govt_jobs/utils/routes/app_pages.dart';

class JobListView extends StatefulWidget {
  @override
  _JobListViewState createState() => _JobListViewState();
}

class _JobListViewState extends State<JobListView> {
  JobListController controller = Get.find<JobListController>();
  AdController adController = Get.find<AdController>();

  CategoryData categoryData = Get.arguments;

  @override
  void initState() {
    controller.qualificationID.value = categoryData.qualificationID!;
    controller.stateId.value = categoryData.stateID!;
    controller.categoryID.value = categoryData.categoryID!;
    // adController.bannerAd.dispose();
    // adController.bannerAd.load();
    // adController.interstitialAd.dispose();
    //
    // Future.delayed(Duration(seconds: 3), () {
    //   adController.loadInterstitialAd();
    //   if (adController.isInterstitialAdReady.value) {
    //     adController.interstitialAd.show();
    //   }
    // });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(categoryData.categoryName!)),
      body: Obx(() {
        if (controller.jobList.isEmpty) {
          return Center(
              child: Text(Strings.noPostsFound, style: AppTextStyle.boldStyle));
        }
        return Stack(
          children: [
            ListView.builder(
              controller: controller.scrollController,
              padding: EdgeInsets.all(10.h),
              // physics: BouncingScrollPhysics(),
              itemCount: controller.jobList.length,
              itemBuilder: (context, index) {
                JobDataModel singleJob = controller.jobList[index];
                return GestureDetector(
                  onTap: () => _handleJobOpenEvent(singleJob),
                  child: JobDetailWidget(jobData: singleJob),
                );
              },
            ),
          ],
        );
      }),
    );
  }

  _handleJobOpenEvent(JobDataModel singleJob) {
    Get.toNamed(Routes.JOBDETAILS, arguments: singleJob);
  }
}

class JobDetailWidget extends StatelessWidget {
  final JobDataModel? jobData;

  const JobDetailWidget({Key? key, this.jobData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.h),
      margin: EdgeInsets.all(5.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: AppColor.justGrayLight),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(jobData!.postName!, style: AppTextStyle.semiBoldStyle),
          SizedBox(height: 5.h),
          Text(jobData!.postDesc!,
              style: AppTextStyle.regularStyle.copyWith(fontSize: 14.sp)),
          SizedBox(height: 5.h),
          Align(
              alignment: Alignment.centerRight,
              child: Text(jobData!.postDate!)),
        ],
      ),
    );
  }
}
