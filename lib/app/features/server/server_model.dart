import 'package:freezed_annotation/freezed_annotation.dart';

part 'server_model.freezed.dart';
part 'server_model.g.dart';

enum ServerStatus { offline, loading, preparing, online }

@freezed
class Server with _$Server {
  const factory Server({
    required String id,
    required String address,
    required ServerStatus status,
  }) = _Server;

  factory Server.fromJson(Map<String, dynamic> json) => _$ServerFromJson(json);
}
