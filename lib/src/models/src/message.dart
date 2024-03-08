part of '../models.dart';

@freezed
class Message with _$Message {
  const factory Message({
    required double latitude,
    required double longitude,
    required double altitude,
    required double speed,
    required double direction,
    @Default({}) Map<String, dynamic> extra,
  }) = _Message;

  factory Message.fromJson(Map<String, dynamic> json) => _$MessageFromJson(json);
}