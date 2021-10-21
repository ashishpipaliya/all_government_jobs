import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:all_govt_jobs/constants/app_color.dart';
import 'package:all_govt_jobs/constants/app_strings.dart';
import 'package:all_govt_jobs/feature/dashboard/dashboard_controller.dart';
import 'package:all_govt_jobs/feature/google_ads/ad_controller.dart';
import 'package:all_govt_jobs/services/model/categories_model.dart';
import 'package:all_govt_jobs/utils/app_text_styles.dart';
import 'package:all_govt_jobs/utils/utils_main.dart';

class DashboardView extends StatefulWidget {
  @override
  _DashboardViewState createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  DashboardController controller = Get.find<DashboardController>();
  AdController adController = Get.find<AdController>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.appName),
        automaticallyImplyLeading: false,
      ),
      body: Stack(
        children: [
          GridView.builder(
            padding: EdgeInsets.only(
                left: 10.r, right: 10.r, top: 10.r, bottom: 100.h),
            physics: BouncingScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, mainAxisSpacing: 5.h, crossAxisSpacing: 5.w),
            itemCount: categoryData.length,
            itemBuilder: (context, index) {
              CategoryData singleCategory = categoryData[index];
              return GestureDetector(
                onTap: () =>
                    controller.handleCategoryClickEvent(singleCategory),
                child: GridAdapter(catData: singleCategory),
              );
            },
          ),
        ],
      ),
    );
  }
}

class GridAdapter extends StatelessWidget {
  final CategoryData? catData;

  const GridAdapter({Key? key, this.catData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: catData!.color!,
        borderRadius: BorderRadius.circular(15.r),
      ),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            catData!.categoryImage!,
            width: 60.w,
            height: 60.h,
          ),
          SizedBox(height: 10.h),
          Text(
            catData!.categoryName!,
            textAlign: TextAlign.center,
            style:
                AppTextStyle.semiBoldStyle.copyWith(color: AppColor.mineShaft),
          ),
        ],
      ),
    );
  }
}
