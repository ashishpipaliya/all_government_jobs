import 'package:get/get.dart';
import 'package:all_govt_jobs/feature/job_list/job_list_controller.dart';

class JobListBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<JobListController>(JobListController());
  }
}
