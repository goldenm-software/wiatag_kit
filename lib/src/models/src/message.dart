part of '../models.dart';

@freezed
class WiatagMessage with _$WiatagMessage {
  const factory WiatagMessage({
    @Default(0) double latitude,
    @Default(0) double longitude,
    @Default(0) double altitude,
    @Default(0) double speed,
    @Default(0) double direction,
    @Default(1) int satellites,
    @Default({}) Map<String, dynamic> extra,
  }) = _WiatagMessage;

  factory WiatagMessage.fromJson(Map<String, dynamic> json) => _$WiatagMessageFromJson(json);
}
