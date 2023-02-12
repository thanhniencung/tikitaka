import 'package:dio/dio.dart';

class Network {
  static final Network _instance = Network._internal();
  factory Network() {
    return _instance;
  }
  Network._internal();

  var dio = Dio();

  void init() {
    var options = BaseOptions(
      baseUrl: 'http://localhost:8080',
      connectTimeout: 5000,
      receiveTimeout: 3000,
    );
    dio = Dio(options);
    dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      // Do something before request is sent
      return handler.next(options); //continue
      // If you want to resolve the request with some custom data，
      // you can resolve a `Response` object eg: `handler.resolve(response)`.
      // If you want to reject the request with a error message,
      // you can reject a `DioError` object eg: `handler.reject(dioError)`
    }, onResponse: (response, handler) {
      // Do something with response data
      return handler.next(response); // continue
      // If you want to reject the request with a error message,
      // you can reject a `DioError` object eg: `handler.reject(dioError)`
    }, onError: (DioError e, handler) {
      // Do something with response error
      return handler.next(e); //continue
      // If you want to resolve the request with some custom data，
      // you can resolve a `Response` object eg: `handler.resolve(response)`.
    }));
  }

  Dio restClient() {
    return dio;
  }
}
