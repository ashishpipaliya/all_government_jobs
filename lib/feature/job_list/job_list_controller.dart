import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:all_govt_jobs/services/base_client.dart';
import 'package:all_govt_jobs/services/model/job_data_model.dart';
import 'package:all_govt_jobs/utils/utils.dart';

class JobListController extends GetxController {
  var jobList = <JobDataModel>[].obs;
  RxInt limit = 0.obs;
  RxString stateId = '0'.obs;
  RxString qualificationID = '0'.obs;
  RxString categoryID = '0'.obs;

  ScrollController scrollController = ScrollController();

  // @override
  // void onInit() {
  //   getJob();
  //   onScroll();
  //   super.onInit();
  // }

  @override
  void onReady() {
    getJob();
    onScroll();
    super.onReady();
  }

  Future<void> getJob() async {
    Map<String, dynamic> params = {};
    params['stateID'] = stateId.value;
    params['limit'] = limit.value;
    params['qualificationID'] = qualificationID.value;
    params['categoryID'] = categoryID.value;

    try {
      Utils.loadingDialog();
      final HttpResponse response =
          await BaseClient().postRequest(ApiType.getJobs, params: params);
      if (response.status == 200) {
        jobList.addAll(JobDataModel.createList(response.data));
      } else {}
    } catch (e) {
      print(e);
    } finally {
      Utils.closeDialog();
    }
  }

  onScroll() {
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.position.pixels) {
        limit++;
        getJob();
        print(limit);
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
