class UserModel {
  bool? flag;
  String? message;
  User? data;

  UserModel.fromMap(Map<String, dynamic> json) {
    flag = json['flag'];
    message = json['message'];
    data = json['flag'] ? User.fromMap(json['data'][0]) : User.fromMap({});
  }
}

class User {
  int? id;
  String? userName;
  String? pass;
  String? name;
  String? checkpoint;
  User.fromMap(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'] ?? '';
    pass = json['pass'] ?? '';
    userName = json['userName'] ?? '';
    checkpoint = json['checkPoint'] ?? '';
  }
}
