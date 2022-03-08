class TirePosition {
  late int tireId;
  late String position;
  late int currentTireDepth;

  late int sTDThreadDepth;

  late String kMWhileChange;

  TirePosition({
    required this.tireId,
    required this.position,
    required this.currentTireDepth,
    required this.sTDThreadDepth,
    required this.kMWhileChange,
  });

  // TirePosition.fromJson(Map<String, dynamic> json) {
  //   tireId = json['tireId'];
  //   position = json['position'];
  //   currentTireDepth = json['currentTireDepth'];
  //   sTDThreadDepth = json['sTDThreadDepth'];
  //   kMWhileChange = json['kMWhileChange'];
  // }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['TireId'] = tireId;
    data['KMWhileChange'] = kMWhileChange;
    data['Position'] = position;
    data['CurrentTireDepth'] = currentTireDepth;
    data['STDThreadDepth'] = sTDThreadDepth;
    return data;
  }
}
