import 'package:get/get.dart';
import 'package:all_govt_jobs/feature/job_details/job_details_controller.dart';

class JobDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<JobDetailsController>(JobDetailsController());
  }
}
