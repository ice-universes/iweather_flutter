import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'error.dart';

class HttpRequest {
  static HttpRequest? _single;
  late Dio _dio;
  late BaseOptions _option;
  late CancelToken _cancelToken;

  HttpRequest._singleton() {
    _option = BaseOptions(
      connectTimeout: 5000, // 连接超时时间
      receiveTimeout: 3000, // 响应超时时间
      responseType: ResponseType.json, // 响应类型
    );

    _dio = Dio(_option);
    _cancelToken = CancelToken();

    // 拦截器
    _dio.interceptors.add(InterceptorsWrapper(
      // 错误拦截器
      onError: (DioError e, errorInterceptorHandler) {
        AppException appException = AppException.create(e);
        debugPrint('==== Dio 请求错误 ====: ${appException.toString()}');
      },
    ));
  }

  // 取消请求
  void cancel({CancelToken? token}) {
    token ?? _cancelToken.cancel("cancelled");
  }

  factory HttpRequest() {
    // 单例模式
    return _single ?? HttpRequest._singleton();
  }

  // get 请求
  Future get(
    String url, {
    Map<String, dynamic>? params,
    Options? options,
  }) async {
    Response resp = await _dio.get(
      url,
      queryParameters: params,
      cancelToken: _cancelToken,
      options: options,
    );

    return resp.data;
  }

  // post 请求
  Future post(
    String url, {
    data,
    Map<String, dynamic>? query,
    Options? options,
  }) async {
    Response resp = await _dio.post(
      url,
      data: data,
      queryParameters: query,
      cancelToken: _cancelToken,
      options: options,
    );

    return resp.data;
  }
}

final requests = HttpRequest();
