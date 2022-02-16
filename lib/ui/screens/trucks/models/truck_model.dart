// class TrucksModel {
//   bool? flag;
//   String? message;
//   List<Truck> trucks = [];
//
//   TrucksModel.fromMap(Map<String, dynamic> json) {
//     flag = json['flag'];
//     message = json['message'];
//     if (json['flag']) {
//       json['data'].forEach((truck) {
//         trucks.add(Truck.fromJson(truck));
//       });
//     }
//   }
// }

class Truck {
  int? truckID;
  String? truckNumber;
  String? truckName;
  String? company;
  String? status;
  int? year;
  String? manufacturer;
  String? type;
  String? size;
  String? unit;
  String? vehicleModelNo;
  int? axleCount;
  String? registration;
  String? engine;
  String? chassis;
  bool? active;
  String? submitDate;
  String? category;
  String? image;
  int? tiresCount;
  int? frontTires;
  int? rareTires;
  int? spareTires;

  Truck(
      {this.truckID,
      this.truckNumber,
      this.truckName,
      this.company,
      this.status,
      this.year,
      this.manufacturer,
      this.type,
      this.size,
      this.unit,
      this.vehicleModelNo,
      this.axleCount,
      this.registration,
      this.engine,
      this.chassis,
      this.active,
      this.submitDate,
      this.category,
      this.image,
      this.tiresCount,
      this.frontTires,
      this.rareTires,
      this.spareTires});

  Truck.fromJson(Map<String, dynamic> json) {
    truckID = json['TruckID'] ?? 0;
    truckNumber = json['TruckNumber'] ?? '';
    truckName = json['TruckName'] ?? '';
    company = json['Company'] ?? '';
    status = json['Status'] ?? '';
    year = json['Year'] ?? 0;
    manufacturer = json['Manufacturer'] ?? '';
    type = json['Type'] ?? '';
    size = json['Size'] ?? '';
    unit = json['Unit'] ?? '';
    vehicleModelNo = json['VehicleModelNo'] ?? '';
    axleCount = json['AxleCount'] ?? 0;
    registration = json['Registration'] ?? '';
    engine = json['Engine'] ?? '';
    chassis = json['Chassis'] ?? '';
    active = json['Active'] ?? false;
    submitDate = json['SubmitDate'] ?? '';
    category = json['Category'] ?? '';
    tiresCount = json['TiresCount'] ?? 0;
    frontTires = json['FrontTires'] ?? 0;
    rareTires = json['RareTires'] ?? 0;
    spareTires = json['SpareTires'] ?? 0;
    image = json['Image'] ?? '';
  }
}
