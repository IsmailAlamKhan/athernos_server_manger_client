// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'server_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Server _$$_ServerFromJson(Map<String, dynamic> json) => _$_Server(
      id: json['id'] as String,
      address: json['address'] as String,
      status: $enumDecode(_$ServerStatusEnumMap, json['status']),
    );

Map<String, dynamic> _$$_ServerToJson(_$_Server instance) => <String, dynamic>{
      'id': instance.id,
      'address': instance.address,
      'status': _$ServerStatusEnumMap[instance.status]!,
    };

const _$ServerStatusEnumMap = {
  ServerStatus.offline: 'offline',
  ServerStatus.loading: 'loading',
  ServerStatus.preparing: 'preparing',
  ServerStatus.online: 'online',
};
