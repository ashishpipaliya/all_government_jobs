/// postID : "16547"
/// categoryID : "10"
/// postName : "28 Posts - Pawan Hans Limited - PHL Recruitment 2021"
/// postDesc : "Pawan Hans Limited has issued the latest notification for PHL Recruitment 2021. Applications are invited for the post of Trainee Technicians. Other details like Education Qualification Details, Required Age Limit, Mode Of selection, Fee Details, and How to Apply are given below…"
/// lastDate : "2021-09-30"
/// stateID : "21"
/// qualificationID : "6"
/// Qualification : "passed a Diploma or the equivalent"
/// Post_Date : "Tue, 14 Sept 2021"
/// eShow : "1"
/// iRelatedPostID : "16470,16451,16456,16459,16414,16417,16391,16405,16411"
/// eLanguage : "eng"
/// eStatus : "Active"

class JobDataModel {
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

  JobDataModel(
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
      this.eStatus});

  JobDataModel.fromJson(dynamic json) {
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
    return map;
  }

  static List<JobDataModel> createList(dynamic json) => (json as List).map((jobDataModel) => JobDataModel.fromJson(jobDataModel)).toList();

}
