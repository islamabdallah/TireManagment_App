import 'package:tire_management/ui/screens/tire_management/models/tire_model.dart';

class SharedModel {
  late String userName;
  late String truckNumber;
  late TireModel tire1;
  late TireModel tire2;
  late String action;

  SharedModel({
    required this.userName,
    required this.action,
    required this.tire1,
    required this.tire2,
    required this.truckNumber,
  });
}
