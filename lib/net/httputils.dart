import 'dart:io';

import 'package:dio/dio.dart';

class HttpUtils {
  static Dio dio;

  /// default options
//  static const String API_PREFIX = 'https://xnpool/api/';
//  static const String oauth_PREFIX = 'https://auth.xnpool.cn/';
  static const int CONNECT_TIMEOUT = 10000;
  static const int RECEIVE_TIMEOUT = 3000;
  static HttpUtils instance;
  CancelToken cancelToken = new CancelToken();

  static HttpUtils getInstance() {
    print("getInstance");
    if (instance == null) {
      instance = new HttpUtils();
    }
    return instance;
  }

  HttpUtils() {
    dio = new Dio();
//    dio.options.baseUrl=API_PREFIX;
    dio.options.responseType = ResponseType.plain;
    dio.options.connectTimeout = CONNECT_TIMEOUT;
    dio.options.receiveTimeout = RECEIVE_TIMEOUT;
    dio.interceptors.add(LogInterceptor(responseBody: false));
    dio.options.headers = {
      HttpHeaders.authorizationHeader:
          "Basic eG5wb29sLWFwcDp4bnBvb2wtYXBwLXNlY3JldA=="
    };
  }

  get(url, {data, options, cancelToken}) async {
    Response response;
    try {
      response = await dio.get(url,
          queryParameters: data, options: options, cancelToken: cancelToken);
    } on DioError catch (e) {
      print('get error---------$e');
      formatError(e);
    }
    return response.data;
  }

  post(url, {data, options, cancelToken}) async {
    Response response;
    try {
      response = await dio.post(url,
          queryParameters: data, options: options, cancelToken: cancelToken);
      print('post success---------${response.data}');
    } on DioError catch (e) {
      print('post error---------$e');
      formatError(e);
    }
    return response.data;
  }

  /*
   * error统一处理
   */
  void formatError(DioError e) {
    if (e.type == DioErrorType.CONNECT_TIMEOUT) {
      // It occurs when url is opened timeout.
      print("连接超时");
    } else if (e.type == DioErrorType.SEND_TIMEOUT) {
      // It occurs when url is sent timeout.
      print("请求超时");
    } else if (e.type == DioErrorType.RECEIVE_TIMEOUT) {
      //It occurs when receiving timeout
      print("响应超时");
    } else if (e.type == DioErrorType.RESPONSE) {
      // When the server response, but with a incorrect status, such as 404, 503...
      print("出现异常");
    } else if (e.type == DioErrorType.CANCEL) {
      // When the request is cancelled, dio will throw a error with this type.
      print("请求取消");
    } else {
      //DEFAULT Default error type, Some other Error. In this case, you can read the DioError.error if it is not null.
      print("未知错误");
    }
  }

  void cancelRequests(CancelToken token) {
    token.cancel("cancelled");
  }
}
