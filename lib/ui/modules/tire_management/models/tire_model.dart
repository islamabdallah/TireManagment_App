class Tire {
  late int id;
  String? position;
  String? tireSerial;
  String? tirebrand;
  String? type;
  String? make;
  String? manufactor;

  Tire({
    required this.id,
    this.position,
    this.tireSerial,
    this.tirebrand,
    this.type,
    this.make,
    this.manufactor,
  });

  Tire.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    position = json['position'];
    tireSerial = json['tireSerial'];
    tirebrand = json['tirebrand'];
  }
  Tire.fromNewTireJson(Map<String, dynamic> json) {
    id = json['tierid'];
    tireSerial = json['serial'];
    tirebrand = json['tirebrand'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = position;
    data['tireSerial'] = tireSerial;
    data['tirebrand'] = tirebrand;
    data['type'] = type;
    data['Make'] = make;
    data['Manufactor'] = manufactor;
    return data;
  }
}
