import 'package:dio/dio.dart';

import '../../utils/utils.dart';
import 'http_client.dart';
import 'http_response.dart';

class DioHttpClient with HttpClient {
  final Dio dio;

  final String baseUrl;

  /// Must be called before using the client. Call it e.g inside the constructor.
  DioHttpClient(this.baseUrl) : dio = Dio()..options = BaseOptions(baseUrl: baseUrl);

  Future<HttpResponse<T>> _request<T>({
    String? path,
    Map<String, dynamic>? params,
    Map<String, dynamic>? headers,
    String method = 'GET',
    dynamic data,
  }) async {
    Response<dynamic> _response;
    String _path = baseUrl;
    if (path != null) {
      _path += path;
    }
    try {
      _response = await dio.request(
        _path,
        queryParameters: params,
        options: Options(method: method, headers: headers),
        data: data,
      );
    } on DioError catch (e) {
      logError('Http request error', error: e);
      throw AppDioException(e);
    }
    dynamic _data = _response.data;
    if (_data is Map) {
      _data = Map<String, dynamic>.from(_data);
      _data = _data['data'];
    }
    return HttpResponse<T>(
      data: _data,
      method: method,
      headers: _response.headers.map,
      statusCode: _response.statusCode ?? 0,
      statusMessage: _response.statusMessage,
    );
  }

  @override
  Future<HttpResponse<T>> get<T>({
    String? path,
    Map<String, dynamic>? params,
    Map<String, dynamic>? headers,
  }) =>
      _request<T>(path: path, params: params, headers: headers);

  @override
  Future<HttpResponse<T>> post<T>({
    String? path,
    Map<String, dynamic>? params,
    Map<String, dynamic>? headers,
    dynamic data,
  }) =>
      _request<T>(path: path, params: params, headers: headers, method: 'POST', data: data);

  @override
  Future<HttpResponse<T>> put<T>({
    String? path,
    Map<String, dynamic>? params,
    Map<String, dynamic>? headers,
    dynamic data,
  }) =>
      _request<T>(path: path, params: params, headers: headers, method: 'PUT', data: data);

  @override
  Future<HttpResponse<T>> delete<T>({
    String? path,
    Map<String, dynamic>? params,
    Map<String, dynamic>? headers,
  }) =>
      _request<T>(path: path, params: params, headers: headers, method: 'DELETE');
}
