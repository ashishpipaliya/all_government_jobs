import 'package:get/get.dart';
import 'package:all_govt_jobs/feature/about/about_view.dart';
import 'package:all_govt_jobs/feature/dashboard/dashboard_binding.dart';
import 'package:all_govt_jobs/feature/dashboard/dashboard_view.dart';
import 'package:all_govt_jobs/feature/job_details/job_details_binding.dart';
import 'package:all_govt_jobs/feature/job_details/job_details_view.dart';
import 'package:all_govt_jobs/feature/job_list/job_list_binding.dart';
import 'package:all_govt_jobs/feature/job_list/job_list_view.dart';
import 'package:all_govt_jobs/feature/splash/splash.dart';
import 'package:all_govt_jobs/feature/webview/webview_bindings.dart';
import 'package:all_govt_jobs/feature/webview/webview_page.dart';

part './app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
        name: Routes.DASHBOARD,
        page: () => DashboardView(),
        binding: DashboardBinding(),
        transition: Transition.fadeIn),
    GetPage(
        name: Routes.JOBLIST,
        page: () => JobListView(),
        binding: JobListBinding(),
        transition: Transition.fadeIn),
    GetPage(
        name: Routes.JOBDETAILS,
        page: () => JobDetailsView(),
        binding: JobDetailsBinding(),
        transition: Transition.fadeIn),
    GetPage(
        name: Routes.SPLASH,
        page: () => SplashScreen(),
        transition: Transition.fadeIn),
    GetPage(
        name: Routes.ABOUT,
        page: () => AboutView(),
        transition: Transition.fadeIn),
    GetPage(
        name: Routes.WEBVIEW,
        page: () => WebviewPage(),
        binding: WebviewBindings(),
        transition: Transition.fadeIn),
    // GetPage(name: Routes.NAVBARMAIN, page: () => NavbarMain(), transition: Transition.fadeIn)
  ];
}
