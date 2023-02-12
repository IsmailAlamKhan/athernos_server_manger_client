// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'http_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HttpResponse<T> {
  int get statusCode => throw _privateConstructorUsedError;
  T get data => throw _privateConstructorUsedError;
  Map<String, dynamic>? get headers => throw _privateConstructorUsedError;
  Map<String, dynamic>? get extra => throw _privateConstructorUsedError;
  String get method => throw _privateConstructorUsedError;
  String? get statusMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HttpResponseCopyWith<T, HttpResponse<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HttpResponseCopyWith<T, $Res> {
  factory $HttpResponseCopyWith(
          HttpResponse<T> value, $Res Function(HttpResponse<T>) then) =
      _$HttpResponseCopyWithImpl<T, $Res, HttpResponse<T>>;
  @useResult
  $Res call(
      {int statusCode,
      T data,
      Map<String, dynamic>? headers,
      Map<String, dynamic>? extra,
      String method,
      String? statusMessage});
}

/// @nodoc
class _$HttpResponseCopyWithImpl<T, $Res, $Val extends HttpResponse<T>>
    implements $HttpResponseCopyWith<T, $Res> {
  _$HttpResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusCode = null,
    Object? data = freezed,
    Object? headers = freezed,
    Object? extra = freezed,
    Object? method = null,
    Object? statusMessage = freezed,
  }) {
    return _then(_value.copyWith(
      statusCode: null == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
      headers: freezed == headers
          ? _value.headers
          : headers // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      extra: freezed == extra
          ? _value.extra
          : extra // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      method: null == method
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as String,
      statusMessage: freezed == statusMessage
          ? _value.statusMessage
          : statusMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HttpResponseCopyWith<T, $Res>
    implements $HttpResponseCopyWith<T, $Res> {
  factory _$$_HttpResponseCopyWith(
          _$_HttpResponse<T> value, $Res Function(_$_HttpResponse<T>) then) =
      __$$_HttpResponseCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call(
      {int statusCode,
      T data,
      Map<String, dynamic>? headers,
      Map<String, dynamic>? extra,
      String method,
      String? statusMessage});
}

/// @nodoc
class __$$_HttpResponseCopyWithImpl<T, $Res>
    extends _$HttpResponseCopyWithImpl<T, $Res, _$_HttpResponse<T>>
    implements _$$_HttpResponseCopyWith<T, $Res> {
  __$$_HttpResponseCopyWithImpl(
      _$_HttpResponse<T> _value, $Res Function(_$_HttpResponse<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusCode = null,
    Object? data = freezed,
    Object? headers = freezed,
    Object? extra = freezed,
    Object? method = null,
    Object? statusMessage = freezed,
  }) {
    return _then(_$_HttpResponse<T>(
      statusCode: null == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
      headers: freezed == headers
          ? _value._headers
          : headers // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      extra: freezed == extra
          ? _value._extra
          : extra // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      method: null == method
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as String,
      statusMessage: freezed == statusMessage
          ? _value.statusMessage
          : statusMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_HttpResponse<T> implements _HttpResponse<T> {
  const _$_HttpResponse(
      {required this.statusCode,
      required this.data,
      final Map<String, dynamic>? headers,
      final Map<String, dynamic>? extra,
      required this.method,
      this.statusMessage})
      : _headers = headers,
        _extra = extra;

  @override
  final int statusCode;
  @override
  final T data;
  final Map<String, dynamic>? _headers;
  @override
  Map<String, dynamic>? get headers {
    final value = _headers;
    if (value == null) return null;
    if (_headers is EqualUnmodifiableMapView) return _headers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final Map<String, dynamic>? _extra;
  @override
  Map<String, dynamic>? get extra {
    final value = _extra;
    if (value == null) return null;
    if (_extra is EqualUnmodifiableMapView) return _extra;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final String method;
  @override
  final String? statusMessage;

  @override
  String toString() {
    return 'HttpResponse<$T>(statusCode: $statusCode, data: $data, headers: $headers, extra: $extra, method: $method, statusMessage: $statusMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HttpResponse<T> &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            const DeepCollectionEquality().equals(other.data, data) &&
            const DeepCollectionEquality().equals(other._headers, _headers) &&
            const DeepCollectionEquality().equals(other._extra, _extra) &&
            (identical(other.method, method) || other.method == method) &&
            (identical(other.statusMessage, statusMessage) ||
                other.statusMessage == statusMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      statusCode,
      const DeepCollectionEquality().hash(data),
      const DeepCollectionEquality().hash(_headers),
      const DeepCollectionEquality().hash(_extra),
      method,
      statusMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HttpResponseCopyWith<T, _$_HttpResponse<T>> get copyWith =>
      __$$_HttpResponseCopyWithImpl<T, _$_HttpResponse<T>>(this, _$identity);
}

abstract class _HttpResponse<T> implements HttpResponse<T> {
  const factory _HttpResponse(
      {required final int statusCode,
      required final T data,
      final Map<String, dynamic>? headers,
      final Map<String, dynamic>? extra,
      required final String method,
      final String? statusMessage}) = _$_HttpResponse<T>;

  @override
  int get statusCode;
  @override
  T get data;
  @override
  Map<String, dynamic>? get headers;
  @override
  Map<String, dynamic>? get extra;
  @override
  String get method;
  @override
  String? get statusMessage;
  @override
  @JsonKey(ignore: true)
  _$$_HttpResponseCopyWith<T, _$_HttpResponse<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
