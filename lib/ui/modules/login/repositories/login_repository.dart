import 'package:dio/dio.dart';

import '../../../../core/constants/api_path.dart';
import '../../../../core/utils/services/remote/dio_helper.dart';

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
    Response loginResponse = await DioService.request(
      method: HttpMethod.POST,
      url: loginUrl,
      data: {
        'email': username,
        'password': pass,
      },
    );

    return loginResponse;
  }
}
