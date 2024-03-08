// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WiatagServerImpl _$$WiatagServerImplFromJson(Map<String, dynamic> json) =>
    _$WiatagServerImpl(
      host: json['host'] as String,
      port: json['port'] as int,
      unitId: json['unitId'] as String,
      password: json['password'] as String? ?? '',
      commandListener: json['commandListener'] == null
          ? const Duration(seconds: 30)
          : const DurationConverter().fromJson(json['commandListener'] as int),
      hasCommands: json['hasCommands'] as bool? ?? true,
    );

Map<String, dynamic> _$$WiatagServerImplToJson(_$WiatagServerImpl instance) =>
    <String, dynamic>{
      'host': instance.host,
      'port': instance.port,
      'unitId': instance.unitId,
      'password': instance.password,
      'commandListener':
          const DurationConverter().toJson(instance.commandListener),
      'hasCommands': instance.hasCommands,
    };

_$WiatagMessageImpl _$$WiatagMessageImplFromJson(Map<String, dynamic> json) =>
    _$WiatagMessageImpl(
      latitude: (json['latitude'] as num?)?.toDouble() ?? 0,
      longitude: (json['longitude'] as num?)?.toDouble() ?? 0,
      altitude: (json['altitude'] as num?)?.toDouble() ?? 0,
      speed: (json['speed'] as num?)?.toDouble() ?? 0,
      direction: (json['direction'] as num?)?.toDouble() ?? 0,
      satellites: json['satellites'] as int? ?? 1,
      extra: json['extra'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$$WiatagMessageImplToJson(_$WiatagMessageImpl instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'altitude': instance.altitude,
      'speed': instance.speed,
      'direction': instance.direction,
      'satellites': instance.satellites,
      'extra': instance.extra,
    };

_$WiatagCommandImpl _$$WiatagCommandImplFromJson(Map<String, dynamic> json) =>
    _$WiatagCommandImpl(
      type: const WiatagCommandTypeConverter().fromJson(json['type'] as String),
      commandId: json['commandId'] as String,
      message: json['message'] as String?,
      title: json['title'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      time: (json['time'] as num?)?.toDouble(),
      messageData: const MessageDataOrNullConverter()
          .fromJson(json['messageData'] as String?),
      state: json['state'] as bool?,
    );

Map<String, dynamic> _$$WiatagCommandImplToJson(_$WiatagCommandImpl instance) =>
    <String, dynamic>{
      'type': const WiatagCommandTypeConverter().toJson(instance.type),
      'commandId': instance.commandId,
      'message': instance.message,
      'title': instance.title,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'time': instance.time,
      'messageData':
          const MessageDataOrNullConverter().toJson(instance.messageData),
      'state': instance.state,
    };
