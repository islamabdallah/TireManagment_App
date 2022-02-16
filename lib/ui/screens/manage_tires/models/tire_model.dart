class TireModel {}

class Tire {
  String? tirePlace;
  int? serialNumber;
  String? make;
  String? type;
  String? manufactor;
  int? id;
  Tire({
    required this.id,
    required this.tirePlace,
    this.type,
    this.make,
    this.manufactor,
  });
}
