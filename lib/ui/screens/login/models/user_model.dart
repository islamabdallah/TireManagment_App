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
