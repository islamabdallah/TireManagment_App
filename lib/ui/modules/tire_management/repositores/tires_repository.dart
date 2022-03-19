import 'package:dio/dio.dart';
import 'package:tire_management/core/utils/services/remote/dio_helper.dart';

import '../../../../core/constants/api_path.dart';
import '../../../shared/constants.dart';
import '../models/fake_data.dart';
import '../models/tire_model.dart';

abstract class TiresRepository {
  Future<Response> getTires();
  Future<Response> setTires(data);
}

class TiresRepositoryImplementation extends TiresRepository {
  @override
  getTires() async {

    print(truckNumber);
    Response tireResponse = await DioService.request(
      method: HttpMethod.POST,
      url: tiresUrl,
      data: {
        'TruckNumber':truckNumber
      }
    );

    print(tireResponse.data);
    return tireResponse;
  }

  @override
  Future<Response> setTires(data) async {
    Response tireResponse = await DioService.request(
        method: HttpMethod.POST,
        url: tiresMovementUrl,
        data: data
    );
    return tireResponse;
  }
}

// class FakeTiresRepositoryImplementation extends TiresRepository {
//   @override
//   getTires() async {
//     List<Tire> tires = [];
//     var json = truck4Tires;
//     for(var tire in json){
//       tires.add(Tire.fromJson(tire));
//     }
//     return tires;
//   }
// }
