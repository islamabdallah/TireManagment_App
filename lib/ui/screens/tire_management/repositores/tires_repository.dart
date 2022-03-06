import 'package:dio/dio.dart';
import 'package:tire_management/core/utils/services/remote/dio_helper.dart';

import '../../../../core/constants/api_path.dart';
import '../fake_data.dart';
import '../models/tire_model.dart';

abstract class TiresRepository {
  List<Tire> getTires();
}

class TiresRepositoryImplementation extends TiresRepository {
  @override
  getTires() async {
    List<Tire> tires = [];

    Response truckResponse = await DioService.request(
      method: HttpMethod.GET,
      url: trucksUrl,
    );
    var json = truckResponse.data;
    if(json['flag']==true){
      for(var tire in json['data']){
        tires.add(Tire.fromJson(tire));
      }
    }
    return tires;
  }
}

class FakeTiresRepositoryImplementation extends TiresRepository {
  @override
  getTires() async {
    List<Tire> tires = [];
    var json = truck4Tires;
    for(var tire in json){
      tires.add(Tire.fromJson(tire));
    }
    return tires;
  }
}
