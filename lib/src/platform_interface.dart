part of '../wiatag_kit.dart';

/// An implementation of [WiatagKitPlatform] that uses method channels.
class MethodChannelWiatagKit extends WiatagKitPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('wiatag_kit');

  @override
  Future<bool?> setServer(WiatagServer server) {
    return methodChannel.invokeMethod<bool>('setServer', server.toJson());
  }

  @override
  Future<WiatagServer?> getServer() async {
    try {
      final json = Map<String, dynamic>.from(await methodChannel.invokeMethod<Map>('getServer') ?? {});
      return WiatagServer.fromJson(json);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<bool?> sendMessage(WiatagMessage message) {
    return methodChannel.invokeMethod<bool>('sendMessage', message.toJson());
  }

  @override
  Future<bool?> senSos([WiatagMessage? message]) {
    return methodChannel.invokeMethod<bool>('senSos', message?.toJson());
  }

  @override
  Future<bool?> sendText(String text, [WiatagMessage? message]) {
    return methodChannel.invokeMethod<bool>('sendText', {'text': text, 'message': message?.toJson()});
  }

  @override
  void addListener(void Function(WiatagCommand) listener) {
    methodChannel.setMethodCallHandler((call) async {
      debugPrint("WiatagKit: ${call.method} ${call.arguments}");
      for (WiatagCommandType type in WiatagCommandType.values) {
        if (type.name == call.method) {
          final msg = Map<String, dynamic>.from(call.arguments);
          msg['type'] = type.name;
          listener(WiatagCommand.fromJson(msg));
          break;
        }
      }
    });
  }
}
