part of '../models.dart';

@freezed
class Server with _$Server {
  const factory Server({
    required String host,
    required int port,
    required String unitId,
    @Default('') String password,
  }) = _Server;

  factory Server.fromJson(Map<String, dynamic> json) => _$ServerFromJson(json);
}