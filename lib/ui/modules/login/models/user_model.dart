class User {
  String? id;
  String? name;
  String? email;
  String? phoneNumber;

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['userName'];
    phoneNumber = json['checkPoint'];
  }
}
