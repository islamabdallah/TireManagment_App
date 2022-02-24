class TireModel {
  late String position;
  String? serial;
  String? type;
  String? make;
  String? manufactor;

  TireModel({
    required this.position,
    this.serial,
    this.type,
    this.make,
    this.manufactor,
  });

  TireModel.fromJson(Map<String, dynamic> json) {
    position = json['name'];
    serial = json['serial'];
    type = json['type'];
    make = json['Make'];
    manufactor = json['Manufactor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.position;
    data['serial'] = this.serial;
    data['type'] = this.type;
    data['Make'] = this.make;
    data['Manufactor'] = this.manufactor;
    return data;
  }
}
