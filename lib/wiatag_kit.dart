library wiatag_kit;

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'src/models/models.dart';
export 'src/models/models.dart';

part 'src/platform_interface.dart';
part 'src/method_channel.dart';

class WiatagKit {
  Future<bool?> setServer(Server server) {
    return WiatagKitPlatform.instance.setServer(server);
  }

  Future<Server?> getServer() {
    return WiatagKitPlatform.instance.getServer();
  }

  Future<bool?> sendMessage(Message message) {
    return WiatagKitPlatform.instance.sendMessage(message);
  }

  Future<bool?> senSos() {
    return WiatagKitPlatform.instance.senSos();
  }
}
