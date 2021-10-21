/// id : "1"
/// name : "All India (AI)"

class StateModel {
  String? id;
  String? name;

  StateModel({this.id, this.name});

  StateModel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }

  static List<StateModel> toList(dynamic json) => (json as List).map((state) => StateModel.fromJson(state)).toList();
}
