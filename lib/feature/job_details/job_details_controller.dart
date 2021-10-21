import 'package:get/get.dart';
import 'package:all_govt_jobs/feature/job_details/related_job_data_model.dart';
import 'package:all_govt_jobs/services/base_client.dart';
import 'package:all_govt_jobs/services/model/sub_post_model.dart';
import 'package:all_govt_jobs/utils/utils.dart';
import 'package:logger/logger.dart';

class JobDetailsController extends GetxController {
  var postID = ''.obs;

  // Sub Post List
  var subPostList = <SubPostModel>[].obs;

  // Related Job List
  var relatedJobList = <RelatedJobDataModel>[].obs;

  @override
  void onInit() {
    getSubPostByPostId();
    super.onInit();
  }

  @override
  void onReady() {
    getRelatedJobs();
    super.onReady();
  }

  Future<void> getSubPostByPostId() async {
    Map<String, dynamic> params = Map<String, dynamic>();
    params['postID'] = postID;

    try {
      final HttpResponse response = await BaseClient()
          .postRequest(ApiType.subPostByPostId, params: params);
      subPostList.addAll(SubPostModel.createList(response.data));
    } catch (e) {
      Logger().e(e);
    }
  }

  Future<void> getRelatedJobs() async {
    Map<String, dynamic> params = Map<String, dynamic>();
    params['post_id'] = postID;

    try {
      Utils.loadingDialog();
      final HttpResponse response =
          await BaseClient().postRequest(ApiType.relatedJobs, params: params);
      relatedJobList.addAll(RelatedJobDataModel.createList(response.data));
    } catch (e) {
      Logger().e(e);
    } finally {
      Utils.closeDialog();
    }
  }
}
