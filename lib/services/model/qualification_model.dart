/// qualificationID : "1"
/// qualification_title : "BBA"
/// qualification_status : "1"

class QualificationModel {
  String? qualificationID;
  String? qualificationTitle;
  String? qualificationStatus;

  QualificationModel({this.qualificationID, this.qualificationTitle, this.qualificationStatus});

  QualificationModel.fromJson(dynamic json) {
    qualificationID = json['qualificationID'];
    qualificationTitle = json['qualification_title'];
    qualificationStatus = json['qualification_status'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['qualificationID'] = qualificationID;
    map['qualification_title'] = qualificationTitle;
    map['qualification_status'] = qualificationStatus;
    return map;
  }

  static List<QualificationModel> toList(dynamic json) => (json as List).map((qualification) => QualificationModel.fromJson(qualification)).toList();
}
