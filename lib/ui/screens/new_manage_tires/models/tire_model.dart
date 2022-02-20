class TireModel {
  late String name;
  String? serial;
  String? type;
  String? make;
  String? manufactor;

  TireModel({
    required this.name,
    this.serial,
    this.type,
    this.make,
    this.manufactor,
  });

  TireModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    serial = json['serial'];
    type = json['type'];
    make = json['Make'];
    manufactor = json['Manufactor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['serial'] = this.serial;
    data['type'] = this.type;
    data['Make'] = this.make;
    data['Manufactor'] = this.manufactor;
    return data;
  }
}
