import 'package:awesome_dropdown/awesome_dropdown.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:all_govt_jobs/constants/app_color.dart';
import 'package:all_govt_jobs/constants/app_strings.dart';
import 'package:all_govt_jobs/services/base_client.dart';
import 'package:all_govt_jobs/services/model/categories_model.dart';
import 'package:all_govt_jobs/services/model/qualification_model.dart';
import 'package:all_govt_jobs/services/model/state_model.dart';
import 'package:all_govt_jobs/utils/app_text_styles.dart';
import 'package:all_govt_jobs/utils/routes/app_pages.dart';
import 'package:all_govt_jobs/utils/utils.dart';
import 'package:all_govt_jobs/widgets/custom_text_button.dart';
import 'package:logger/logger.dart';

class DashboardController extends GetxController {
  var statesList = <StateModel>[].obs;
  var qualificationList = <QualificationModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    getStates();
    getQualifications();
  }

  getStates() async {
    try {
      HttpResponse response =
          await BaseClient().getRequest(ApiType.getAllState);
      if (response.status == 200) {
        statesList.addAll(StateModel.toList(response.data));
      } else {
        print(response.errMessage);
      }
    } catch (e) {
      Logger().e(e);
    }
  }

  getQualifications() async {
    try {
      HttpResponse response =
          await BaseClient().getRequest(ApiType.getAllQualification);
      if (response.status == 200) {
        qualificationList.addAll(QualificationModel.toList(response.data));
      } else {
        print(response.errMessage);
      }
    } catch (e) {
      Logger().e(e);
    }
  }

  handleCategoryClickEvent(CategoryData category) {
    switch (category.index) {
      case 0:
        Get.toNamed(Routes.JOBLIST, arguments: category);
        break;
      case 1:
        searchByState();
        break;
      case 2:
        print('Current Affairs');
        break;
      case 3:
      case 4:
      case 5:
      case 6:
      case 7:
      case 8:
      case 9:
      case 10:
      case 11:
      case 12:
      case 13:
      case 14:
        Get.toNamed(Routes.JOBLIST, arguments: category);
        break;
      case 15:
        print('Admit card');
        break;
      case 16:
        print('Private Jobs');
        break;
      case 17:
        Get.toNamed(Routes.ABOUT);
        break;
      default:
        Get.toNamed(Routes.JOBLIST, arguments: category);
    }
  }

  Rx<String> selectedState = ''.obs;
  Rx<String> selectedQualification = ''.obs;

  void onStateSelected(String value) {
    selectedState.value = value;
  }

  void onQualificationSelected(String value) {
    selectedQualification.value = value;
  }

  String get stateId => statesList
      .where((element) => element.name == selectedState.value.toString())
      .first
      .id!;

  String get qualificationId => qualificationList
      .where((element) =>
          element.qualificationTitle == selectedQualification.value.toString())
      .first
      .qualificationID!;

  searchByState() {
    Get.defaultDialog(
        title: Strings.searchBYStateAndQualification,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Obx(() {
              return AwesomeDropDown(
                dropDownList: statesList.map((e) => e.name!).toList(),
                dropDownIcon: Icon(Icons.arrow_drop_down, color: Colors.grey),
                selectedItemTextStyle: AppTextStyle.buttonTextStyle,
                selectedItem: selectedState.value,
                dropDownBottomBorderRadius: 0,
                dropDownBorderRadius: 0,
                dropDownTopBorderRadius: 0,
                onDropDownItemClick: (selectedItem) {
                  onStateSelected(selectedItem);
                },
              );
            }),
            Obx(() {
              return AwesomeDropDown(
                dropDownList: qualificationList
                    .map((e) => e.qualificationTitle!)
                    .toList(),
                dropDownIcon: Icon(Icons.arrow_drop_down, color: Colors.grey),
                elevation: 1,
                selectedItem: selectedQualification.value,
                selectedItemTextStyle: AppTextStyle.buttonTextStyle,
                dropDownBottomBorderRadius: 0,
                dropDownBorderRadius: 0,
                dropDownTopBorderRadius: 0,
                onDropDownItemClick: (selectedItem) {
                  onQualificationSelected(selectedItem);
                },
              );
            }),
          ],
        ),
        actions: [
          CustomTextButton(
            title: Strings.search,
            onPressed: () {
              if (selectedQualification.value.isNotEmpty &&
                  selectedState.value.isNotEmpty) {
                Utils.closeDialog();
                Get.toNamed(Routes.JOBLIST,
                    arguments: CategoryData(
                        qualificationID: qualificationId,
                        stateID: stateId,
                        categoryName: Strings.appName));
              } else {
                if (Get.isSnackbarOpen!) {
                  Get.back();
                }
                Get.snackbar(Strings.error, Strings.stateQualificationEmpty,
                    backgroundColor: AppColor.blueDianne,
                    snackPosition: SnackPosition.BOTTOM,
                    snackStyle: SnackStyle.FLOATING,
                    colorText: AppColor.white);
              }
            },
            buttonColor: AppColor.jungleGreen,
          ),
          CustomTextButton(
            title: Strings.cancel,
            onPressed: () {
              Utils.closeDialog();
            },
            buttonColor: AppColor.amaranth,
          ),
        ]);

    // Get.defaultDialog(
    //     title: Strings.searchBYStateAndQualification,
    //     content: Column(
    //       mainAxisSize: MainAxisSize.min,
    //       children: [
    //         Obx(() {
    //           return AwesomeDropDown(
    //             isPanDown: false,
    //             dropDownList: controller.statesList.map((e) => e.name!).toList(),
    //             dropDownIcon: Icon(
    //               Icons.arrow_drop_down,
    //               color: Colors.grey,
    //             ),
    //             dropDownListTextStyle: AppTextStyle.buttonTextStyle,
    //             selectedItem: controller.selectedState.value,
    //             dropDownBottomBorderRadius: 0,
    //             dropDownBorderRadius: 0,
    //             dropDownTopBorderRadius: 0,
    //             onDropDownItemClick: (selectedItem) {
    //               controller.onStateSelected(selectedItem);
    //             },
    //           );
    //         }),
    //         Obx(() {
    //           return AwesomeDropDown(
    //             isPanDown: false,
    //             dropDownList: controller.qualificationList.map((e) => e.qualificationTitle!).toList(),
    //             dropDownIcon: Icon(
    //               Icons.arrow_drop_down,
    //               color: Colors.grey,
    //             ),
    //             selectedItem: controller.selectedQualification.value,
    //             dropDownListTextStyle: AppTextStyle.buttonTextStyle,
    //             dropDownBottomBorderRadius: 0,
    //             dropDownBorderRadius: 0,
    //             dropDownTopBorderRadius: 0,
    //             onDropDownItemClick: (selectedItem) {
    //               controller.onQualificationSelected(selectedItem);
    //             },
    //           );
    //         }),
    //       ],
    //     ),
    //     actions: [
    //       CustomTextButton(
    //         title: "Search",
    //         onPressed: () {
    //           print("Search");
    //         },
    //         buttonColor: AppColor.jungleGreen,
    //       ),
    //       CustomTextButton(
    //         title: "Cancel",
    //         onPressed: () {
    //           print("Cancel");
    //         },
    //         buttonColor: AppColor.amaranth,
    //       ),
    //     ]);
  }
}
