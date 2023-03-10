import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../features.dart';

final localStorageProvider = Provider<LocalStorage>((ref) => LocalStorageSharedPrefImpl());

abstract class LocalStorage {
  Future<void> init();
  Future<void> clear();
  Future<void> delete(LocalStorageKeys key);
  Future<bool> containsKey(LocalStorageKeys key);
  Future<T> get<T>(
    LocalStorageKeys key, {
    T? defaultValue,
    T Function(Map<String, dynamic>)? fromJson,
  });
  Future<void> set<T>(LocalStorageKeys key, T value);
}

class LocalStorageDummyImpl implements LocalStorage {
  @override
  Future<void> clear() async {}

  @override
  Future<bool> containsKey(LocalStorageKeys key) => Future.value(false);

  @override
  Future<void> delete(LocalStorageKeys key) async {}

  @override
  Future<T> get<T>(
    LocalStorageKeys key, {
    T? defaultValue,
    T Function(Map<String, dynamic> p1)? fromJson,
  }) async =>
      defaultValue as T;
  @override
  Future<void> init() async {}

  @override
  Future<void> set<T>(LocalStorageKeys key, T value) async {}
}

class LocalStorageSharedPrefImpl implements LocalStorage {
  SharedPreferences? _sharedPreferences;
  SharedPreferences get sharedPreferences {
    assert(_sharedPreferences != null, 'LocalStorage not initialized');

    return _sharedPreferences!;
  }

  @override
  Future<void> clear() => sharedPreferences.clear();

  @override
  Future<bool> containsKey(LocalStorageKeys key) async => sharedPreferences.containsKey(key.key);

  @override
  Future<void> delete(LocalStorageKeys key) => sharedPreferences.remove(key.key);

  @override
  Future<T> get<T>(
    LocalStorageKeys key, {
    T? defaultValue,
    T Function(Map<String, dynamic>)? fromJson,
  }) async {
    final value = sharedPreferences.get(key.key);
    if (value == null && defaultValue != null) {
      return defaultValue;
    }
    if (fromJson != null && value != null) {
      return fromJson(jsonDecode(value as String));
    }
    return value as T;
  }

  @override
  Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  @override
  Future<void> set<T>(LocalStorageKeys key, T value) {
    if (value is bool) {
      return sharedPreferences.setBool(key.key, value);
    } else if (value is double) {
      return sharedPreferences.setDouble(key.key, value);
    } else if (value is int) {
      return sharedPreferences.setInt(key.key, value);
    } else if (value is String) {
      return sharedPreferences.setString(key.key, value);
    } else if (value is Map) {
      return sharedPreferences.setString(key.key, jsonEncode(value));
    } else if (value is List) {
      return sharedPreferences.setString(key.key, jsonEncode(value));
    } else if (value is LocalStorageModel) {
      return sharedPreferences.setString(key.key, jsonEncode(value.toJson()));
    }
    throw Exception('Unsupported type');
  }
}
