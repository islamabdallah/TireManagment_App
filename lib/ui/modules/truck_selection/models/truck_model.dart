class Truck {
  int? truckId;
  String? truckName;
  String? truckNumber;
  String? truckCompany;
  int? truckYear;
  String? status;
  String? manufacturer;
  String? type;
  String? size;
  String? unit;
  bool? active;
  String? chassis;
  String? engine;
  String? registeration;
  int? axleCount;
  String? vehichleModelNo;
  String? category;
  String? image;

  // String? image;
  // String? submitDate;
  // int? tiresCount;
  // int? frontTires;
  // int? rareTires;
  // int? spareTires;

  Truck({
    this.truckId,
    this.truckNumber,
    this.truckName,
    this.truckCompany,
    this.status,
    this.truckYear,
    this.manufacturer,
    this.type,
    this.size,
    this.unit,
    this.vehichleModelNo,
    this.axleCount,
    this.registeration,
    this.engine,
    this.chassis,
    this.active,
    this.category,
    this.image,
    // this.image,
    // this.submitDate,
    // this.tiresCount,
    // this.frontTires,
    // this.rareTires,
    // this.spareTires,
  });

  Truck.fromJson(Map<String, dynamic> json) {
    truckId = json['truckId'];
    truckNumber = json['truckNumber'];
    truckName = json['truckName'];
    truckCompany = json['truckCompany'];
    status = json['status'];
    truckYear = json['truckYear'];
    manufacturer = json['manufacturer'];
    type = json['type'];
    size = json['size'];
    unit = json['unit'];
    vehichleModelNo = json['vehichleModelNo'];
    axleCount = json['axleCount'];
    registeration = json['registeration'];
    engine = json['engine'];
    chassis = json['chassis'];
    active = json['active'];
    category = json['category'];
    image = json['image'];
    // submitDate = json['SubmitDate'] ?? '';
    // tiresCount = json['TiresCount'] ?? 0;
    // frontTires = json['FrontTires'] ?? 0;
    // rareTires = json['RareTires'] ?? 0;
    // spareTires = json['SpareTires'] ?? 0;
    // image = json['Image'] ?? '';
  }
}
