import 'package:all_govt_jobs/services/ad_helper.dart';

/// postID : "16391"
/// categoryID : "5"
/// postName : "302 Posts - Naval Ship Repair Yard - NSRY Recruitment 2021(All India Can Apply)"
/// postDesc : "Naval Ship Repair Yard has issued the latest notification for NSRY Recruitment 2021. Applications are invited for the post of Electrician, Fitter & Others. Other details like Education Qualification Details, Required Age Limit, Mode Of selection, Fee Details, and How to Apply are given below."
/// lastDate : "2021-09-29"
/// stateID : "1"
/// qualificationID : "3"
/// Qualification : "passed 10th or the equivalent"
/// Post_Date : "Mon, 23 Aug 2021"
/// eShow : "1"
/// iRelatedPostID : "16179,16167,16146,16155,16113,16116,16122,16134"
/// eLanguage : "eng"
/// eStatus : "Active"
/// subpostID : "19611"
/// subpostName : "1) Post Name: Tradesman"
/// noOfpost : "302 Posts"
/// salary : "Rs.19,900 – Rs. 63,200/-"
/// qualification : "passed 10th or the equivalent"
/// ageLimit : "18 to 25 Years"
/// Link : "https://www.govtexamupdate.com/2021/08/302-posts-naval-ship-repair-yard-nsry.html"

class RelatedJobDataModel {
  String? postID;
  String? categoryID;
  String? postName;
  String? postDesc;
  String? lastDate;
  String? stateID;
  String? qualificationID;
  String? qualification;
  String? postDate;
  String? eShow;
  String? iRelatedPostID;
  String? eLanguage;
  String? eStatus;
  String? subpostID;
  String? subpostName;
  String? noOfpost;
  String? salary;
  String? ageLimit;
  String? link;

  RelatedJobDataModel(
      {this.postID,
      this.categoryID,
      this.postName,
      this.postDesc,
      this.lastDate,
      this.stateID,
      this.qualificationID,
      this.qualification,
      this.postDate,
      this.eShow,
      this.iRelatedPostID,
      this.eLanguage,
      this.eStatus,
      this.subpostID,
      this.subpostName,
      this.noOfpost,
      this.salary,
      this.ageLimit,
      this.link});

  String? get postLink =>
      link?.replaceAll("https://www.govtexamupdate.com/", AdHelper.websiteUrl);

  RelatedJobDataModel.fromJson(dynamic json) {
    postID = json['postID'];
    categoryID = json['categoryID'];
    postName = json['postName'];
    postDesc = json['postDesc'];
    lastDate = json['lastDate'];
    stateID = json['stateID'];
    qualificationID = json['qualificationID'];
    qualification = json['Qualification'];
    postDate = json['Post_Date'];
    eShow = json['eShow'];
    iRelatedPostID = json['iRelatedPostID'];
    eLanguage = json['eLanguage'];
    eStatus = json['eStatus'];
    subpostID = json['subpostID'];
    subpostName = json['subpostName'];
    noOfpost = json['noOfpost'];
    salary = json['salary'];
    ageLimit = json['ageLimit'];
    link = json['Link'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['postID'] = postID;
    map['categoryID'] = categoryID;
    map['postName'] = postName;
    map['postDesc'] = postDesc;
    map['lastDate'] = lastDate;
    map['stateID'] = stateID;
    map['qualificationID'] = qualificationID;
    map['Qualification'] = qualification;
    map['Post_Date'] = postDate;
    map['eShow'] = eShow;
    map['iRelatedPostID'] = iRelatedPostID;
    map['eLanguage'] = eLanguage;
    map['eStatus'] = eStatus;
    map['subpostID'] = subpostID;
    map['subpostName'] = subpostName;
    map['noOfpost'] = noOfpost;
    map['salary'] = salary;
    map['ageLimit'] = ageLimit;
    map['Link'] = link;
    return map;
  }

  static List<RelatedJobDataModel> createList(dynamic json) => (json as List)
      .map((jobDataModel) => RelatedJobDataModel.fromJson(jobDataModel))
      .toList();
}
