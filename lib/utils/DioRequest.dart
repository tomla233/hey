import 'package:dio/dio.dart';
import 'package:hey/constant/GlobalConstants.dart';
/// dio请求工具类
class DioRequest {
  final _dio = Dio();
  DioRequest() {
    _dio.options
      ..baseUrl = GlobalConstants.baseUrl
      ..connectTimeout = const Duration(seconds: GlobalConstants.timeout)
      ..sendTimeout = const Duration(seconds: GlobalConstants.timeout)
      ..receiveTimeout = const Duration(seconds: GlobalConstants.timeout);
    _addInterceptor();
  }
  void _addInterceptor() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (request, handler) {
          // 注入token request headers Authorization = "Bearer token"
          // if (tokenManager.getToken().isNotEmpty) {
          //   request.headers = {
          //     "Authorization": "Bearer ${tokenManager.getToken()}",
          //   };
          // }
          handler.next(request);
        },
        onResponse: (response, handler) {
          if (response.statusCode! >= 200 && response.statusCode! < 300) {
            handler.next(response);
            return;
          }

          handler.reject(DioException(requestOptions: response.requestOptions));
        },
        onError: (error, handler) {
          handler.reject(
            DioException(
              requestOptions: error.requestOptions,
              message: error.response?.data["msg"] ?? " ",
            ),
          );
        },
      ),
    );
  }
  Future<dynamic> get(String url, {Map<String, dynamic>? params}) {
    return _handleResponse(_dio.get(url, queryParameters: params));
  }
  Future<dynamic> post(String url, {Map<String, dynamic>? data}) {
    return _handleResponse(_dio.post(url, data: data));
  }
  Future<dynamic> _handleResponse(Future<Response<dynamic>> task) async {
    try {
      Response<dynamic> res = await task;
      final data = res.data as Map<String, dynamic>;
      if (data["code"] == GlobalConstants.successCode) {
        return data["result"];
      }
    } catch (e) {
      rethrow;
    }
  }
}

final dioRequest = DioRequest();
