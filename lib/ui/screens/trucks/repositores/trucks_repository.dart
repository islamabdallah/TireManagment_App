import 'package:dio/dio.dart';
import 'package:tire_management/core/constants/end_points.dart';
import 'package:tire_management/core/utils/services/remote/dio_helper.dart';
import 'package:tire_management/ui/screens/trucks/models/truck_model.dart';

abstract class TrucksRepository {
  getTrucks();
}

class TrucksRepositoryImplementation extends TrucksRepository {
  @override
  getTrucks() async {
    Response truckResponse = await DioHelper.postData(
      url: TRUCKS,
    );
    return truckResponse;
  }
}

class FakeTrucksRepositoryImplementation extends TrucksRepository {
  List<Truck> trucks = [
    Truck(
      truckNumber: '375',
      company: 'Cemex Topmix L L C',
      truckName: 'Concrete Pump',
      status: 'Operational',
      manufacturer: 'MERCEDES',
      type: 'PUTZMEISTER',
      size: '42',
      unit: 'Mtr',
      vehicleModelNo: '3241',
      axleCount: 4,
      registration: 'G 99272',
      engine: 'NIL',
      chassis: 'WDB9333056L067026',
      submitDate: '13-02-2022',
      category: 'Concrete Pump 12 Tires',
      tiresCount: 12,
      frontTires: 4,
      rareTires: 8,
      spareTires: 1,
      year: 2005,
    ),
    Truck(
      truckNumber: '376',
      company: 'Cemex Topmix L L C',
      truckName: 'Concrete Pump',
      status: 'Operational',
      manufacturer: 'MERCEDES',
      type: 'PUTZMEISTER',
      size: '42',
      unit: 'Mtr',
      vehicleModelNo: '3241',
      axleCount: 4,
      registration: 'G 99272',
      engine: 'NIL',
      chassis: 'WDB9333056L067026',
      submitDate: '13-02-2022',
      category: 'Concrete Pump 12 Tires',
      tiresCount: 12,
      frontTires: 4,
      rareTires: 8,
      spareTires: 1,
      year: 2005,
    ),
    Truck(
      truckNumber: '377',
      company: 'Cemex Topmix L L C',
      truckName: 'Concrete Pump',
      status: 'Operational',
      manufacturer: 'MERCEDES',
      type: 'PUTZMEISTER',
      size: '42',
      unit: 'Mtr',
      vehicleModelNo: '3241',
      axleCount: 4,
      registration: 'G 99272',
      engine: 'NIL',
      chassis: 'WDB9333056L067026',
      submitDate: '13-02-2022',
      category: 'Concrete Pump 12 Tires',
      tiresCount: 12,
      frontTires: 4,
      rareTires: 8,
      spareTires: 1,
      year: 2005,
    ),
  ];

  @override
  getTrucks() async {
    return trucks;
  }
}
