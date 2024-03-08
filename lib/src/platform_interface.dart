part of '../wiatag_kit.dart';

/// An implementation of [WiatagKitPlatform] that uses method channels.
class MethodChannelWiatagKit extends WiatagKitPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('wiatag_kit');

  @override
  Future<bool?> setServer(Server server) {
    return methodChannel.invokeMethod<bool>('setServer', server.toJson());
  }

  @override
  Future<Server?> getServer() async {
    try {
      final json = Map<String, dynamic>.from(await methodChannel.invokeMethod<Map>('getServer') ?? {});
      return Server.fromJson(json);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<bool?> sendMessage(Message message) {
    throw UnimplementedError('sendMessage() has not been implemented.');
  }

  @override
  Future<bool?> senSos() {
    return methodChannel.invokeMethod<bool>('senSos');
  }
}
