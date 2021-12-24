import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import 'package:all_govt_jobs/constants/app_color.dart';
import 'package:all_govt_jobs/services/connectivity_manager/connectivity_binding.dart';
import 'package:all_govt_jobs/utils/app_text_styles.dart';
import 'package:all_govt_jobs/utils/routes/app_pages.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:all_govt_jobs/services/ad_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await initialSettings();
  runApp(MyApp());
}

Future<void> initialSettings() async {
  await initialize();
  await GetStorage.init();
  // await MobileAds.initialize();

  // get website url
  await AdHelper.setInitialData();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      BoxConstraints(
        maxWidth: Get.width,
        maxHeight: Get.height,
      ),
      designSize: Get.size,
    );

    FirebaseAnalytics analytics = FirebaseAnalytics();

    return Center(
      child: GetMaterialApp(
        title: 'All Government Jobs',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: AppColor.white,
            scaffoldBackgroundColor: AppColor.white,
            appBarTheme: AppBarTheme(
                systemOverlayStyle: SystemUiOverlayStyle.dark,
                centerTitle: true,
                elevation: 0,
                color: AppColor.justGrayLight,
                titleTextStyle:
                    AppTextStyle.buttonTextStyle.copyWith(fontSize: 20.w),
                iconTheme: IconThemeData(
                  color: Colors.black,
                ))),
        initialBinding: ConnectivityBinding(),
        getPages: AppPages.pages,
        initialRoute: Routes.DASHBOARD,
        navigatorObservers: [
          FirebaseAnalyticsObserver(analytics: analytics),
        ],
      ),
    );
  }
}
