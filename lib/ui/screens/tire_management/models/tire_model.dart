class Tire {
  late int id;
  late String position;
  String? tireSerial;
  String? type;
  String? make;
  String? manufactor;

  Tire({
    required this.id,
    required this.position,
    this.tireSerial,
    this.type,
    this.make,
    this.manufactor,
  });

  Tire.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    position = json['position'];
    tireSerial = json['tireSerial'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = position;
    data['tireSerial'] = tireSerial;
    data['type'] = type;
    data['Make'] = make;
    data['Manufactor'] = manufactor;
    return data;
  }
}
