part of '../wiatag_kit.dart';

abstract class WiatagKitPlatform extends PlatformInterface {
  /// Constructs a WiatagKitPlatform.
  WiatagKitPlatform() : super(token: _token);

  static final Object _token = Object();

  static WiatagKitPlatform _instance = MethodChannelWiatagKit();

  /// The default instance of [WiatagKitPlatform] to use.
  ///
  /// Defaults to [MethodChannelWiatagKit].
  static WiatagKitPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [WiatagKitPlatform] when
  /// they register themselves.
  static set instance(WiatagKitPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<bool?> setServer(WiatagServer server) {
    throw UnimplementedError('setServer() has not been implemented.');
  }

  Future<WiatagServer?> getServer() {
    throw UnimplementedError('getServer() has not been implemented.');
  }

  Future<bool?> sendMessage(WiatagMessage message) {
    throw UnimplementedError('sendMessage() has not been implemented.');
  }

  Future<bool?> sendSos([WiatagMessage? message]) {
    throw UnimplementedError('sendSos() has not been implemented.');
  }

  Future<bool?> sendText(String text, [WiatagMessage? message]) {
    throw UnimplementedError('sendText() has not been implemented.');
  }

  void addListener(void Function(WiatagCommand) listener) {
    throw UnimplementedError('addListener() has not been implemented.');
  }
}
