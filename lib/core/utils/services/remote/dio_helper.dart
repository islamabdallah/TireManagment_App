import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;
  static void init() {
    dio = Dio(
      BaseOptions(
        baseUrl: '',
      ),
    );
  }

// post
  static Future<Response> postData(
      {required url, Map<String, dynamic>? data, language = 'en'}) {
    return dio.post(
      url,
      data: data,
      // options: Options(
      //   headers: {
      //     'lang': language,
      //     'Content_Type': 'application/json',
      //   },
      //   validateStatus: (status) {
      //     return status! <= 500;
      //   },
      // ),
    );
  }

// put
  static Future<Response> putData(
      {required endPoint, Map<String, dynamic>? data, language = 'en'}) {
    return dio.put(
      endPoint,
      data: data,
      options: Options(
        headers: {
          'lang': language,
          'Content_Type': 'application/json',
        },
        validateStatus: (status) {
          return status! <= 500;
        },
      ),
    );
  }

  // delete
  static Future<Response> deleteData(
      {required endPoint, Map<String, dynamic>? data, language = 'en'}) {
    return dio.delete(
      endPoint,
      data: data,
      options: Options(
        headers: {
          'lang': language,
          'Content_Type': 'application/json',
        },
        validateStatus: (status) {
          return status! <= 500;
        },
      ),
    );
  }

// get
  static Future<Response> getData({required url, language = 'en'}) {
    return dio.get(
      url,
      options: Options(
        headers: {
          //'lang': language,
          'Content_Type': 'application/json',
        },
      ),
    );
  }
}
