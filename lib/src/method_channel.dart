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

  Future<bool?> setServer(Server server) {
    throw UnimplementedError('setServer() has not been implemented.');
  }

  Future<Server?> getServer() {
    throw UnimplementedError('getServer() has not been implemented.');
  }

  Future<bool?> sendMessage(Message message) {
    throw UnimplementedError('sendMessage() has not been implemented.');
  }

  Future<bool?> senSos() {
    throw UnimplementedError('senSos() has not been implemented.');
  }
}
