import 'package:freezed_annotation/freezed_annotation.dart';

part 'http_response.freezed.dart';

@freezed
class HttpResponse<T> with _$HttpResponse<T> {
  const factory HttpResponse({
    required int statusCode,
    required T data,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    required String method,
    String? statusMessage,
  }) = _HttpResponse;
}
