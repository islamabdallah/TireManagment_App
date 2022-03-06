class User {
  int? id;
  String? name;
  String? userName;
  String? email;
  String? password;
  String? phoneNumber;

  User.fromMap(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    userName = json['userName'];
    email = json['userName'];
    phoneNumber = json['checkPoint'];
  }
}
