part of '../models.dart';

@freezed
class WiatagServer with _$WiatagServer {
  const factory WiatagServer({
    /// [host] defines the host of the server. Check your platform (WIalon or Flespi) to get the right
    /// host.
    required String host,

    /// [port] defines the port of the server. Check your platform (WIalon or Flespi) to get the right
    /// port
    required int port,

    /// [unitId] defines the unitId of the server. This unitId should be the IMEI, or ident in flespi.
    /// Also, this value depends of the value registered in the platform.
    required String unitId,

    /// [password] defines the password of the server. This password should be the password registered in
    /// the platform. By default is an empty string.
    @Default('') String password,

    /// [commandListener] defines the time in seconds to check for commands. By default is 30 seconds.
    @Default(Duration(seconds: 30)) @DurationConverter() Duration commandListener,

    /// [hasCommands] defines if the server has commands to check. By default is true.
    @Default(true) bool hasCommands,
  }) = _WiatagServer;

  factory WiatagServer.fromJson(Map<String, dynamic> json) => _$WiatagServerFromJson(json);
}

class DurationConverter implements JsonConverter<Duration, int> {
  const DurationConverter();

  @override
  Duration fromJson(int json) {
    return Duration(seconds: json);
  }

  @override
  int toJson(Duration object) {
    return object.inSeconds;
  }
}
