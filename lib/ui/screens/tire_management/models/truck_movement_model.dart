import 'tire_position_model.dart';

class TruckMovementModel {
  late String truckNumber;
  late String userId;
  late String movementType;
  late List<TirePosition>? tiresPosition;

  TruckMovementModel({
    required this.truckNumber,
    required this.userId,
    required this.movementType,
    this.tiresPosition,
  });
  //
  // TruckMovementModel.fromJson(Map<String, dynamic> json) {
  //   truckNumber = json['truckNumber'];
  //   userId = json['userId'];
  //   movementType = json['movementType'];
  //   if (json['tires'] != null) {
  //     json['tires'].forEach((v) {
  //       tiresPosition?.add(TirePosition.fromJson(v));
  //     });
  //   }
  // }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['TruckNumber'] = truckNumber;
    data['MovementType'] = movementType;
    data['UserId'] = userId;
    data['TirePositionViewModel'] = tiresPosition?.map((v) => v.toJson()).toList();
    return data;
  }

}
