part of '../models.dart';

@freezed
class WiatagCommand with _$WiatagCommand {
  const factory WiatagCommand({
    @WiatagCommandTypeConverter() required WiatagCommandType type,
    required String commandId,
    String? message,
    String? title,
    double? latitude,
    double? longitude,
    double? time,
    @MessageDataOrNullConverter() Map<String, dynamic>? messageData,
    bool? state,
  }) = _WiatagCommand;

  factory WiatagCommand.fromJson(Map<String, dynamic> json) => _$WiatagCommandFromJson(json);
}

enum WiatagCommandType {
  chatMessageReceived,
  startServiceCommand,
  stopServiceCommand,
  getPosition,
  sendSosCommand,
  remoteConfigRequest,
  torch,
}

class WiatagCommandTypeConverter implements JsonConverter<WiatagCommandType, String> {
  const WiatagCommandTypeConverter();

  @override
  WiatagCommandType fromJson(String json) {
    switch (json) {
      case 'chatMessageReceived':
        return WiatagCommandType.chatMessageReceived;
      case 'startServiceCommand':
        return WiatagCommandType.startServiceCommand;
      case 'stopServiceCommand':
        return WiatagCommandType.stopServiceCommand;
      case 'getPosition':
        return WiatagCommandType.getPosition;
      case 'sendSosCommand':
        return WiatagCommandType.sendSosCommand;
      case 'remoteConfigRequest':
        return WiatagCommandType.remoteConfigRequest;
      case 'torch':
        return WiatagCommandType.torch;
      default:
        throw Exception('Unknown WiatagCommandType: $json');
    }
  }

  @override
  String toJson(WiatagCommandType object) {
    switch (object) {
      case WiatagCommandType.chatMessageReceived:
        return 'chatMessageReceived';
      case WiatagCommandType.startServiceCommand:
        return 'startServiceCommand';
      case WiatagCommandType.stopServiceCommand:
        return 'stopServiceCommand';
      case WiatagCommandType.getPosition:
        return 'getPosition';
      case WiatagCommandType.sendSosCommand:
        return 'sendSosCommand';
      case WiatagCommandType.remoteConfigRequest:
        return 'remoteConfigRequest';
      case WiatagCommandType.torch:
        return 'torch';
    }
  }
}

class MessageDataOrNullConverter implements JsonConverter<Map<String, dynamic>?, String?> {
  const MessageDataOrNullConverter();

  @override
  Map<String, dynamic>? fromJson(String? json) {
    if (json == null) return null;
    return Map<String, dynamic>.from(jsonDecode(json));
  }

  @override
  String? toJson(Map<String, dynamic>? object) {
    if (object == null) return null;
    return jsonEncode(object);
  }
}
