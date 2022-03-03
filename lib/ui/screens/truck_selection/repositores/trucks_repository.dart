import 'package:dio/dio.dart';
import 'package:tire_management/core/utils/services/remote/dio_helper.dart';
import '../../../../core/constants/api_path.dart';
import '../../truck_selection/models/truck_model.dart';

abstract class TrucksRepository {
  List<Truck> getTrucks();
}

class TrucksRepositoryImplementation extends TrucksRepository {
  @override
  getTrucks() async {
    List<Truck> trucks = [];

    Response truckResponse = await DioService.request(
      method: HttpMethod.GET,
      url: trucksUrl,
    );
    var json = truckResponse.data;
    if(json['flag']==true){
      for(var truck in json['data']){
        trucks.add(Truck.fromJson(truck));
      }
    }
    return trucks;
  }
}

class FakeTrucksRepositoryImplementation extends TrucksRepository {
  List<Truck> trucks = [
    Truck(
      truckNumber: '375',
      truckCompany: 'Cemex Topmix L L C',
      truckName: 'Concrete Pump',
      status: 'Operational',
      manufacturer: 'MERCEDES',
      type: 'PUTZMEISTER',
      size: '42',
      unit: 'Mtr',
      vehichleModelNo: '3241',
      axleCount: 4,
      registration: 'G 99272',
      engine: 'NIL',
      chassis: 'WDB9333056L067026',
      category: 'Concrete Pump 12 Tires',
      truckYear: 2005,
      // submitDate: '13-02-2022',
      // tiresCount: 12,
      // frontTires: 4,
      // rareTires: 8,
      // spareTires: 1,
    ),
    Truck(
      truckNumber: '376',
      truckCompany: 'Cemex Topmix L L C',
      truckName: 'Concrete Pump',
      status: 'Operational',
      manufacturer: 'MERCEDES',
      type: 'PUTZMEISTER',
      size: '42',
      unit: 'Mtr',
      vehichleModelNo: '3241',
      axleCount: 4,
      registration: 'G 99272',
      engine: 'NIL',
      chassis: 'WDB9333056L067026',
      category: 'Concrete Pump 12 Tires',
      truckYear: 2005,
      // submitDate: '13-02-2022',
      // tiresCount: 12,
      // frontTires: 4,
      // rareTires: 8,
      // spareTires: 1,
    ),
    Truck(
      truckNumber: '377',
      truckCompany: 'Cemex Topmix L L C',
      truckName: 'Concrete Pump',
      status: 'Operational',
      manufacturer: 'MERCEDES',
      type: 'PUTZMEISTER',
      size: '42',
      unit: 'Mtr',
      vehichleModelNo: '3241',
      axleCount: 4,
      registration: 'G 99272',
      engine: 'NIL',
      chassis: 'WDB9333056L067026',
      truckYear: 2005,
      category: 'Concrete Pump 12 Tires',
      // submitDate: '13-02-2022',
      // tiresCount: 12,
      // frontTires: 4,
      // rareTires: 8,
      // spareTires: 1,
    ),
  ];

  @override
  getTrucks() async {
    return trucks;
  }
}
