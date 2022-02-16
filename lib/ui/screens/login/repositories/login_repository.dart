import 'package:dio/dio.dart';
import 'package:tire_management/core/constants/end_points.dart';
import 'package:tire_management/core/utils/services/remote/dio_helper.dart';

abstract class LoginRepository {
  Future<Response> loginUser({
    required String username,
    required String pass,
  });
}

class LoginRepositoryImplementation extends LoginRepository {
  @override
  loginUser({
    required String username,
    required String pass,
  }) async {
    Response loginResponse = await DioHelper.postData(
      url: LOGIN,
      data: {
        'username': username,
        'pass': pass,
      },
    );
    return loginResponse;
  }
}
