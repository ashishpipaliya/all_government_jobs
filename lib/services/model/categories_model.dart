import 'dart:ui';

import 'package:all_govt_jobs/constants/app_color.dart';
import 'package:all_govt_jobs/constants/app_image.dart';
import 'package:all_govt_jobs/constants/app_strings.dart';

enum CategoryType {
  LatestJobs,
  SearchByState,
  CurrentAffairs,
  Tenthtwelvepass,
  GraduateAndPostGraduate,
  Ssc,
  Defence,
  Police,
  PscAndUpsc,
  Banking,
  Railway,
  Engineering,
  WalkInJob,
  MedicalJobs,
  OtherJobs,
  AdmitCard,
  PrivateJobs
}

class CategoryData {
  String? categoryName;
  String? categoryID;
  String? categoryImage;
  String? qualificationID;
  String? stateID;
  int limit;
  Color? color;
  int? index;

  CategoryData({
    this.categoryName,
    this.categoryID = '0',
    this.categoryImage,
    this.qualificationID = '0',
    this.stateID = '0',
    this.limit = 0,
    this.color = AppColor.doveGray,
    this.index,
  });
}

List<CategoryData> get categoryData => [
      CategoryData(
          categoryName: Strings.latestJobs,
          categoryImage: AppImage.latestJobs,
          color: Color(0xFF95DAC1),
          index: 0),
      CategoryData(
          categoryName: Strings.searchBYStateAndQualification,
          categoryImage: AppImage.searchByState,
          color: Color(0xFFFF96AD),
          index: 1),
      // CategoryData(categoryName: Strings.currentAffairs, categoryImage: AppImage.currentAffairs, color: Color(0xFFEEC4C4), index: 2),
      CategoryData(
          categoryName: Strings.tenthtwelvepass,
          qualificationID: '3,7',
          categoryImage: AppImage.tenthAndTwelth,
          color: Color(0xFFFFEBA1),
          index: 3),
      CategoryData(
          categoryName: Strings.graduateAndPostGraduate,
          qualificationID: '4,5',
          categoryImage: AppImage.graduateAndPostGraduate,
          color: Color(0xFFF7DBF0),
          index: 4),
      CategoryData(
          categoryName: Strings.ssc,
          categoryID: '2',
          categoryImage: AppImage.ssc,
          color: Color(0xFF93B5C6),
          index: 5),
      CategoryData(
          categoryName: Strings.defence,
          categoryID: '5',
          categoryImage: AppImage.defence,
          color: Color(0xFFDDBEBE),
          index: 6),
      CategoryData(
          categoryName: Strings.police,
          categoryID: '6',
          categoryImage: AppImage.police,
          color: Color(0xFFC9D8B6),
          index: 7),
      CategoryData(
          categoryName: Strings.pscAndUpsc,
          categoryID: '8,3',
          categoryImage: AppImage.pasUpsc,
          color: Color(0xB557837B),
          index: 8),
      CategoryData(
          categoryName: Strings.banking,
          categoryID: '1',
          categoryImage: AppImage.banking,
          color: Color(0xFFDBE6FD),
          index: 9),
      CategoryData(
          categoryName: Strings.railway,
          categoryID: '4',
          categoryImage: AppImage.railway,
          color: Color(0xFFDA7F8F),
          index: 10),
      CategoryData(
          categoryName: Strings.engineering,
          categoryID: '7',
          categoryImage: AppImage.engineering,
          color: Color(0xFFF5CEBE),
          index: 11),
      CategoryData(
          categoryName: Strings.walkInJob,
          categoryID: '9',
          categoryImage: AppImage.walkinJobs,
          color: Color(0xFFF25287),
          index: 12),
      CategoryData(
          categoryName: Strings.medicalJobs,
          qualificationID: '14,15,17,28,34',
          categoryImage: AppImage.medicalJobs,
          color: Color(0xFFCDAC81),
          index: 13),
      CategoryData(
          categoryName: Strings.otherJobs,
          categoryID: '10',
          categoryImage: AppImage.otherJobs,
          color: Color(0xFFCAE4DB),
          index: 14),
      // CategoryData(categoryName: Strings.admitCard, categoryImage: AppImage.admitCard, color: Color(0xFFCE97CD), index: 15),
      // CategoryData(categoryName: Strings.privateJobs, categoryImage: AppImage.privateJobs, color: Color(0xFFEBCFC4), index: 16),
      CategoryData(
          categoryName: Strings.aboutUs,
          categoryImage: AppImage.aboutUs,
          color: Color(0xFFB1B2D2),
          index: 17),
    ];

/*
Government jobs app

latest jobs => http://allgovernmentjobportal.com/newapi/ws/admin/getJobs
10 and 12th => qualificationID = 3,7 , limit=0
Graduate and Post Graduate => qualificationID = 4,5
SSC => categoryId = 2, stateID = 0
Defence => categoryId = 5, stateId = 0
Police => categoryId = 6, stateId = 0
PSC and UPSC => categoryId = 8,3  stateId = 0
Banking => categoryId = 1  stateId = 0
Railway => categoryId =4  stateId = 0
engineering => categoryId = 7  stateId = 0
walkin jobs => categoryId = 9  stateId = 0
medical jobs => categoryId = 14, 15,17,28,34  stateId = 0
other jobs => categoryId = 10  stateId = 0

 */
