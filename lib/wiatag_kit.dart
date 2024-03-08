library wiatag_kit;

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'src/models/models.dart';
export 'src/models/models.dart';

part 'src/platform_interface.dart';
part 'src/method_channel.dart';

class WiatagKit {
  Future<bool?> setServer(WiatagServer server) {
    return WiatagKitPlatform.instance.setServer(server);
  }

  Future<WiatagServer?> getServer() {
    return WiatagKitPlatform.instance.getServer();
  }

  Future<bool?> sendMessage(WiatagMessage message) {
    return WiatagKitPlatform.instance.sendMessage(message);
  }

  Future<bool?> sendSos([WiatagMessage? message]) {
    return WiatagKitPlatform.instance.sendSos(message);
  }

  Future<bool?> sendText(String text, [WiatagMessage? message]) {
    return WiatagKitPlatform.instance.sendText(text, message);
  }

  void addListener(void Function(WiatagCommand) listener) {
    WiatagKitPlatform.instance.addListener(listener);
  }
}
