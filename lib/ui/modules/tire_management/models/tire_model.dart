class Tire {
  int? tireId;
  String? tirePosition;
  String? tireSerial;
  String? tireBrand;
  String? tireSize;
  String? distance;

  Tire({
    this.tireId,
    this.tirePosition,
    this.tireSerial,
    this.tireBrand,
    this.distance,
  });

  Tire.fromJson(Map<String, dynamic> json) {
    tireId = json['tireId'];
    tirePosition = json['tirePosition'];
    tireSerial = json['tireSerial'];
    tireBrand = json['tirebrand'];
    tireSize = json['tireSize'];
    distance = json['distance'];
  }
  Tire.fromNewTireJson(Map<String, dynamic> json) {
    tireId = json['tierid'];
    tireSerial = json['serial'];
    tireBrand = json['brand'];
    tireSize = json['size'];
    distance = json['distance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['tireId'] = tireId;
    data['tirePosition'] = tirePosition;
    data['tireSerial'] = tireSerial;
    data['tirebrand'] = tireBrand;
    data['distance'] = distance;
    return data;
  }
}
