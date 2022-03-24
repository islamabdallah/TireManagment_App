class Tire {
  int? tireId;
  String? tirePosition;
  String? tireSerial;
  String? tirebrand;

  Tire({
    this.tireId,
    this.tirePosition,
    this.tireSerial,
    this.tirebrand,
  });

  Tire.fromJson(Map<String, dynamic> json) {
    tireId = json['tireId'];
    tirePosition = json['tirePosition'];
    tireSerial = json['tireSerial'];
    tirebrand = json['tirebrand'];
  }
  Tire.fromNewTireJson(Map<String, dynamic> json) {
    tireId = json['tierid'];
    tireSerial = json['serial'];
    tirebrand = json['tirebrand'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['tireId'] = tireId;
    data['tirePosition'] = tirePosition;
    data['tireSerial'] = tireSerial;
    data['tirebrand'] = tirebrand;
    return data;
  }
}
