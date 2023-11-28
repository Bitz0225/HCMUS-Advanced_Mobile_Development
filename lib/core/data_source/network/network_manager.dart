import 'package:dio/dio.dart';

class NetworkManager {
  static late Dio dio;
  Future<Dio> initDio() async {
    try {
      dio = Dio(
        BaseOptions(
          baseUrl: '',
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
          contentType: 'application/json',
          headers: {
            'Accept': 'application/json',
          },
          receiveDataWhenStatusError: true,
        )
      );
      return dio;
    } on DioException catch (e) {
      rethrow;
    }
  }
  // Future get(String path, {Map<String, dynamic>? queryParameters});
  // Future post(String path,
  //     {Map<String, dynamic>? queryParameters,
  //     Map<String, dynamic>? data});
  //
}