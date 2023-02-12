import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../utils/config.dart';
import 'http.dart';

final httpClientProvider = Provider<HttpClient>((ref) {
  return DioHttpClient(ref.read(configProvider).url);
});

mixin HttpClient {
  Future<HttpResponse<T>> get<T>({
    String? path,
    Map<String, dynamic>? params,
    Map<String, dynamic>? headers,
  });

  Future<HttpResponse<T>> post<T>({
    String? path,
    Map<String, dynamic>? params,
    Map<String, dynamic>? headers,
    dynamic data,
  });

  Future<HttpResponse<T>> put<T>({
    String? path,
    Map<String, dynamic>? params,
    Map<String, dynamic>? headers,
    dynamic data,
  });

  Future<HttpResponse<T>> delete<T>({
    String? path,
    Map<String, dynamic>? params,
    Map<String, dynamic>? headers,
  });
}

/// Mix this with services
mixin HttpClientService implements HttpClient {
  abstract final Ref ref;
  HttpClient? _client;
  HttpClient get client {
    assert(_client != null, 'HttpClientService.init() must be called before using the client');
    return _client!;
  }

  /// Must be called before using the client. Call it e.g inside the constructor.
  void init() {
    _client = ref.read(httpClientProvider);
  }

  @override
  Future<HttpResponse<T>> delete<T>({
    String? path,
    Map<String, dynamic>? params,
    Map<String, dynamic>? headers,
  }) =>
      client.delete<T>(path: path, params: params, headers: headers);

  @override
  Future<HttpResponse<T>> get<T>({
    String? path,
    Map<String, dynamic>? params,
    Map<String, dynamic>? headers,
  }) =>
      client.get<T>(path: path, params: params, headers: headers);

  @override
  Future<HttpResponse<T>> post<T>({
    String? path,
    Map<String, dynamic>? params,
    Map<String, dynamic>? headers,
    dynamic data,
  }) =>
      client.post<T>(path: path, params: params, headers: headers, data: data);

  @override
  Future<HttpResponse<T>> put<T>({
    String? path,
    Map<String, dynamic>? params,
    Map<String, dynamic>? headers,
    dynamic data,
  }) =>
      client.put<T>(path: path, params: params, headers: headers, data: data);
}
