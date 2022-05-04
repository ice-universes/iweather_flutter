import 'package:dio/dio.dart';

// 自定义异常
class AppException implements Exception {
  final String? _message;
  final int? _code;

  AppException([
    this._code,
    this._message,
  ]);

  @override
  String toString() {
    return '[code: $_code] $_message';
  }

  factory AppException.create(DioError error) {
    // DioErrorType 枚举介绍: https://pub.dev/documentation/dio/latest/dio/DioErrorType.html
    switch (error.type) {
      case DioErrorType.cancel:
        return BadRequestException(-1, "请求取消");
      case DioErrorType.connectTimeout:
        return BadRequestException(-1, "连接超时");
      case DioErrorType.sendTimeout:
        return BadRequestException(-1, "请求超时");
      case DioErrorType.receiveTimeout:
        return BadRequestException(-1, "响应超时");
      case DioErrorType.response:
        {
          int? code = error.response?.statusCode;
          switch (code) {
            case 400:
              return BadRequestException(code, "请求语法错误");
            case 401:
              return UnauthorisedException(code, "缺少API密钥或密钥未激活");
            case 403:
              return UnauthorisedException(code, "服务器拒绝执行");
            case 404:
              return UnauthorisedException(code, "API请求错误");
            case 405:
              return UnauthorisedException(code, "请求方法被禁止");
            case 429:
              return UnauthorisedException(code, "超出免费限制");
            case 500:
              return UnauthorisedException(code, "服务器内部错误");
            case 502:
              return UnauthorisedException(code, "无效请求");
            case 503:
              return UnauthorisedException(code, "服务器宕机");
            case 505:
              return UnauthorisedException(code, "不支持HTTP协议请求");
            default:
              return AppException(code, error.response?.statusMessage);
          }
        }
      default:
        return AppException(-1, error.message);
    }
  }
}

// 请求错误
class BadRequestException extends AppException {
  BadRequestException([int? code, String? message]) : super(code, message);
}

// 未认证异常
class UnauthorisedException extends AppException {
  UnauthorisedException([int? code, String? message]) : super(code, message);
}
