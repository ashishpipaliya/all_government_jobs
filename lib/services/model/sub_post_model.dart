import '../ad_helper.dart';

/// subpostID : "19746"
/// postID : "16526"
/// subpostName : "1) Post Name: Sub Inspector (SI), Constable"
/// noOfpost : "2607 Posts"
/// salary : "Rs. 19900 – Rs. 35400/-"
/// qualification : "passed Degree or the equivalent"
/// ageLimit : "18 to 28 Years"
/// Link : "https://www.govtexamupdate.com/2021/09/punjabPolice-Recruitment-2021.html"
///
///
///
/// my url :  https://thegovernmentexamupdate.blogspot.com/

class SubPostModel {
  String? subpostID;
  String? postID;
  String? subpostName;
  String? noOfpost;
  String? salary;
  String? qualification;
  String? ageLimit;
  String? link;

  SubPostModel({this.subpostID, this.postID, this.subpostName, this.noOfpost, this.salary, this.qualification, this.ageLimit, this.link});

  SubPostModel.fromJson(dynamic json) {
    subpostID = json['subpostID'];
    postID = json['postID'];
    subpostName = json['subpostName'];
    noOfpost = json['noOfpost'];
    salary = json['salary'];
    qualification = json['qualification'];
    ageLimit = json['ageLimit'];
    link = json['Link'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['subpostID'] = subpostID;
    map['postID'] = postID;
    map['subpostName'] = subpostName;
    map['noOfpost'] = noOfpost;
    map['salary'] = salary;
    map['qualification'] = qualification;
    map['ageLimit'] = ageLimit;
    map['Link'] = link;
    return map;
  }

  String? get postLink => link?.replaceAll("https://www.govtexamupdate.com/", AdHelper.websiteUrl);


  static List<SubPostModel> createList(dynamic json) => (json as List).map((subPost) => SubPostModel.fromJson(subPost)).toList();
}
