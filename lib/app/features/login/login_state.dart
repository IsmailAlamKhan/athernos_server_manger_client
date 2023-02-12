import 'package:freezed_annotation/freezed_annotation.dart';

import '../features.dart';

part 'login_state.freezed.dart';
part 'login_state.g.dart';

@freezed
class LoginState with _$LoginState, LocalStorageModel {
  const factory LoginState({
    String? username,
    String? password,
  }) = _LoginState;

  factory LoginState.fromJson(Map<String, dynamic> json) => _$LoginStateFromJson(json);
}
