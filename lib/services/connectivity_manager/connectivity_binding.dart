import 'package:get/get.dart';
import 'package:all_govt_jobs/feature/dashboard/dashboard_controller.dart';
import 'package:all_govt_jobs/feature/general/general_controller.dart';
import 'package:all_govt_jobs/feature/google_ads/ad_controller.dart';
import 'package:all_govt_jobs/services/connectivity_manager/connectivity_service.dart';

class ConnectivityBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ConnectivityController>(() => ConnectivityController());
    Get.lazyPut<DashboardController>(() => DashboardController());
    Get.put<AdController>(AdController());
    Get.put<GeneralController>(GeneralController());
  }
}
