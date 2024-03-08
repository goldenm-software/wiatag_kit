// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WiatagServer _$WiatagServerFromJson(Map<String, dynamic> json) {
  return _WiatagServer.fromJson(json);
}

/// @nodoc
mixin _$WiatagServer {
  /// [host] defines the host of the server. Check your platform (WIalon or Flespi) to get the right
  /// host.
  String get host => throw _privateConstructorUsedError;

  /// [port] defines the port of the server. Check your platform (WIalon or Flespi) to get the right
  /// port
  int get port => throw _privateConstructorUsedError;

  /// [unitId] defines the unitId of the server. This unitId should be the IMEI, or ident in flespi.
  /// Also, this value depends of the value registered in the platform.
  String get unitId => throw _privateConstructorUsedError;

  /// [password] defines the password of the server. This password should be the password registered in
  /// the platform. By default is an empty string.
  String get password => throw _privateConstructorUsedError;

  /// [commandListener] defines the time in seconds to check for commands. By default is 30 seconds.
  @DurationConverter()
  Duration get commandListener => throw _privateConstructorUsedError;

  /// [hasCommands] defines if the server has commands to check. By default is true.
  bool get hasCommands => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WiatagServerCopyWith<WiatagServer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WiatagServerCopyWith<$Res> {
  factory $WiatagServerCopyWith(
          WiatagServer value, $Res Function(WiatagServer) then) =
      _$WiatagServerCopyWithImpl<$Res, WiatagServer>;
  @useResult
  $Res call(
      {String host,
      int port,
      String unitId,
      String password,
      @DurationConverter() Duration commandListener,
      bool hasCommands});
}

/// @nodoc
class _$WiatagServerCopyWithImpl<$Res, $Val extends WiatagServer>
    implements $WiatagServerCopyWith<$Res> {
  _$WiatagServerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? host = null,
    Object? port = null,
    Object? unitId = null,
    Object? password = null,
    Object? commandListener = null,
    Object? hasCommands = null,
  }) {
    return _then(_value.copyWith(
      host: null == host
          ? _value.host
          : host // ignore: cast_nullable_to_non_nullable
              as String,
      port: null == port
          ? _value.port
          : port // ignore: cast_nullable_to_non_nullable
              as int,
      unitId: null == unitId
          ? _value.unitId
          : unitId // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      commandListener: null == commandListener
          ? _value.commandListener
          : commandListener // ignore: cast_nullable_to_non_nullable
              as Duration,
      hasCommands: null == hasCommands
          ? _value.hasCommands
          : hasCommands // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WiatagServerImplCopyWith<$Res>
    implements $WiatagServerCopyWith<$Res> {
  factory _$$WiatagServerImplCopyWith(
          _$WiatagServerImpl value, $Res Function(_$WiatagServerImpl) then) =
      __$$WiatagServerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String host,
      int port,
      String unitId,
      String password,
      @DurationConverter() Duration commandListener,
      bool hasCommands});
}

/// @nodoc
class __$$WiatagServerImplCopyWithImpl<$Res>
    extends _$WiatagServerCopyWithImpl<$Res, _$WiatagServerImpl>
    implements _$$WiatagServerImplCopyWith<$Res> {
  __$$WiatagServerImplCopyWithImpl(
      _$WiatagServerImpl _value, $Res Function(_$WiatagServerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? host = null,
    Object? port = null,
    Object? unitId = null,
    Object? password = null,
    Object? commandListener = null,
    Object? hasCommands = null,
  }) {
    return _then(_$WiatagServerImpl(
      host: null == host
          ? _value.host
          : host // ignore: cast_nullable_to_non_nullable
              as String,
      port: null == port
          ? _value.port
          : port // ignore: cast_nullable_to_non_nullable
              as int,
      unitId: null == unitId
          ? _value.unitId
          : unitId // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      commandListener: null == commandListener
          ? _value.commandListener
          : commandListener // ignore: cast_nullable_to_non_nullable
              as Duration,
      hasCommands: null == hasCommands
          ? _value.hasCommands
          : hasCommands // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WiatagServerImpl implements _WiatagServer {
  const _$WiatagServerImpl(
      {required this.host,
      required this.port,
      required this.unitId,
      this.password = '',
      @DurationConverter() this.commandListener = const Duration(seconds: 30),
      this.hasCommands = true});

  factory _$WiatagServerImpl.fromJson(Map<String, dynamic> json) =>
      _$$WiatagServerImplFromJson(json);

  /// [host] defines the host of the server. Check your platform (WIalon or Flespi) to get the right
  /// host.
  @override
  final String host;

  /// [port] defines the port of the server. Check your platform (WIalon or Flespi) to get the right
  /// port
  @override
  final int port;

  /// [unitId] defines the unitId of the server. This unitId should be the IMEI, or ident in flespi.
  /// Also, this value depends of the value registered in the platform.
  @override
  final String unitId;

  /// [password] defines the password of the server. This password should be the password registered in
  /// the platform. By default is an empty string.
  @override
  @JsonKey()
  final String password;

  /// [commandListener] defines the time in seconds to check for commands. By default is 30 seconds.
  @override
  @JsonKey()
  @DurationConverter()
  final Duration commandListener;

  /// [hasCommands] defines if the server has commands to check. By default is true.
  @override
  @JsonKey()
  final bool hasCommands;

  @override
  String toString() {
    return 'WiatagServer(host: $host, port: $port, unitId: $unitId, password: $password, commandListener: $commandListener, hasCommands: $hasCommands)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WiatagServerImpl &&
            (identical(other.host, host) || other.host == host) &&
            (identical(other.port, port) || other.port == port) &&
            (identical(other.unitId, unitId) || other.unitId == unitId) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.commandListener, commandListener) ||
                other.commandListener == commandListener) &&
            (identical(other.hasCommands, hasCommands) ||
                other.hasCommands == hasCommands));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, host, port, unitId, password, commandListener, hasCommands);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WiatagServerImplCopyWith<_$WiatagServerImpl> get copyWith =>
      __$$WiatagServerImplCopyWithImpl<_$WiatagServerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WiatagServerImplToJson(
      this,
    );
  }
}

abstract class _WiatagServer implements WiatagServer {
  const factory _WiatagServer(
      {required final String host,
      required final int port,
      required final String unitId,
      final String password,
      @DurationConverter() final Duration commandListener,
      final bool hasCommands}) = _$WiatagServerImpl;

  factory _WiatagServer.fromJson(Map<String, dynamic> json) =
      _$WiatagServerImpl.fromJson;

  @override

  /// [host] defines the host of the server. Check your platform (WIalon or Flespi) to get the right
  /// host.
  String get host;
  @override

  /// [port] defines the port of the server. Check your platform (WIalon or Flespi) to get the right
  /// port
  int get port;
  @override

  /// [unitId] defines the unitId of the server. This unitId should be the IMEI, or ident in flespi.
  /// Also, this value depends of the value registered in the platform.
  String get unitId;
  @override

  /// [password] defines the password of the server. This password should be the password registered in
  /// the platform. By default is an empty string.
  String get password;
  @override

  /// [commandListener] defines the time in seconds to check for commands. By default is 30 seconds.
  @DurationConverter()
  Duration get commandListener;
  @override

  /// [hasCommands] defines if the server has commands to check. By default is true.
  bool get hasCommands;
  @override
  @JsonKey(ignore: true)
  _$$WiatagServerImplCopyWith<_$WiatagServerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WiatagMessage _$WiatagMessageFromJson(Map<String, dynamic> json) {
  return _WiatagMessage.fromJson(json);
}

/// @nodoc
mixin _$WiatagMessage {
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  double get altitude => throw _privateConstructorUsedError;
  double get speed => throw _privateConstructorUsedError;
  double get direction => throw _privateConstructorUsedError;
  int get satellites => throw _privateConstructorUsedError;
  Map<String, dynamic> get extra => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WiatagMessageCopyWith<WiatagMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WiatagMessageCopyWith<$Res> {
  factory $WiatagMessageCopyWith(
          WiatagMessage value, $Res Function(WiatagMessage) then) =
      _$WiatagMessageCopyWithImpl<$Res, WiatagMessage>;
  @useResult
  $Res call(
      {double latitude,
      double longitude,
      double altitude,
      double speed,
      double direction,
      int satellites,
      Map<String, dynamic> extra});
}

/// @nodoc
class _$WiatagMessageCopyWithImpl<$Res, $Val extends WiatagMessage>
    implements $WiatagMessageCopyWith<$Res> {
  _$WiatagMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
    Object? altitude = null,
    Object? speed = null,
    Object? direction = null,
    Object? satellites = null,
    Object? extra = null,
  }) {
    return _then(_value.copyWith(
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      altitude: null == altitude
          ? _value.altitude
          : altitude // ignore: cast_nullable_to_non_nullable
              as double,
      speed: null == speed
          ? _value.speed
          : speed // ignore: cast_nullable_to_non_nullable
              as double,
      direction: null == direction
          ? _value.direction
          : direction // ignore: cast_nullable_to_non_nullable
              as double,
      satellites: null == satellites
          ? _value.satellites
          : satellites // ignore: cast_nullable_to_non_nullable
              as int,
      extra: null == extra
          ? _value.extra
          : extra // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WiatagMessageImplCopyWith<$Res>
    implements $WiatagMessageCopyWith<$Res> {
  factory _$$WiatagMessageImplCopyWith(
          _$WiatagMessageImpl value, $Res Function(_$WiatagMessageImpl) then) =
      __$$WiatagMessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double latitude,
      double longitude,
      double altitude,
      double speed,
      double direction,
      int satellites,
      Map<String, dynamic> extra});
}

/// @nodoc
class __$$WiatagMessageImplCopyWithImpl<$Res>
    extends _$WiatagMessageCopyWithImpl<$Res, _$WiatagMessageImpl>
    implements _$$WiatagMessageImplCopyWith<$Res> {
  __$$WiatagMessageImplCopyWithImpl(
      _$WiatagMessageImpl _value, $Res Function(_$WiatagMessageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
    Object? altitude = null,
    Object? speed = null,
    Object? direction = null,
    Object? satellites = null,
    Object? extra = null,
  }) {
    return _then(_$WiatagMessageImpl(
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      altitude: null == altitude
          ? _value.altitude
          : altitude // ignore: cast_nullable_to_non_nullable
              as double,
      speed: null == speed
          ? _value.speed
          : speed // ignore: cast_nullable_to_non_nullable
              as double,
      direction: null == direction
          ? _value.direction
          : direction // ignore: cast_nullable_to_non_nullable
              as double,
      satellites: null == satellites
          ? _value.satellites
          : satellites // ignore: cast_nullable_to_non_nullable
              as int,
      extra: null == extra
          ? _value._extra
          : extra // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WiatagMessageImpl implements _WiatagMessage {
  const _$WiatagMessageImpl(
      {this.latitude = 0,
      this.longitude = 0,
      this.altitude = 0,
      this.speed = 0,
      this.direction = 0,
      this.satellites = 1,
      final Map<String, dynamic> extra = const {}})
      : _extra = extra;

  factory _$WiatagMessageImpl.fromJson(Map<String, dynamic> json) =>
      _$$WiatagMessageImplFromJson(json);

  @override
  @JsonKey()
  final double latitude;
  @override
  @JsonKey()
  final double longitude;
  @override
  @JsonKey()
  final double altitude;
  @override
  @JsonKey()
  final double speed;
  @override
  @JsonKey()
  final double direction;
  @override
  @JsonKey()
  final int satellites;
  final Map<String, dynamic> _extra;
  @override
  @JsonKey()
  Map<String, dynamic> get extra {
    if (_extra is EqualUnmodifiableMapView) return _extra;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_extra);
  }

  @override
  String toString() {
    return 'WiatagMessage(latitude: $latitude, longitude: $longitude, altitude: $altitude, speed: $speed, direction: $direction, satellites: $satellites, extra: $extra)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WiatagMessageImpl &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.altitude, altitude) ||
                other.altitude == altitude) &&
            (identical(other.speed, speed) || other.speed == speed) &&
            (identical(other.direction, direction) ||
                other.direction == direction) &&
            (identical(other.satellites, satellites) ||
                other.satellites == satellites) &&
            const DeepCollectionEquality().equals(other._extra, _extra));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      latitude,
      longitude,
      altitude,
      speed,
      direction,
      satellites,
      const DeepCollectionEquality().hash(_extra));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WiatagMessageImplCopyWith<_$WiatagMessageImpl> get copyWith =>
      __$$WiatagMessageImplCopyWithImpl<_$WiatagMessageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WiatagMessageImplToJson(
      this,
    );
  }
}

abstract class _WiatagMessage implements WiatagMessage {
  const factory _WiatagMessage(
      {final double latitude,
      final double longitude,
      final double altitude,
      final double speed,
      final double direction,
      final int satellites,
      final Map<String, dynamic> extra}) = _$WiatagMessageImpl;

  factory _WiatagMessage.fromJson(Map<String, dynamic> json) =
      _$WiatagMessageImpl.fromJson;

  @override
  double get latitude;
  @override
  double get longitude;
  @override
  double get altitude;
  @override
  double get speed;
  @override
  double get direction;
  @override
  int get satellites;
  @override
  Map<String, dynamic> get extra;
  @override
  @JsonKey(ignore: true)
  _$$WiatagMessageImplCopyWith<_$WiatagMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WiatagCommand _$WiatagCommandFromJson(Map<String, dynamic> json) {
  return _WiatagCommand.fromJson(json);
}

/// @nodoc
mixin _$WiatagCommand {
  @WiatagCommandTypeConverter()
  WiatagCommandType get type => throw _privateConstructorUsedError;
  String get commandId => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  double? get latitude => throw _privateConstructorUsedError;
  double? get longitude => throw _privateConstructorUsedError;
  double? get time => throw _privateConstructorUsedError;
  @MessageDataOrNullConverter()
  Map<String, dynamic>? get messageData => throw _privateConstructorUsedError;
  bool? get state => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WiatagCommandCopyWith<WiatagCommand> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WiatagCommandCopyWith<$Res> {
  factory $WiatagCommandCopyWith(
          WiatagCommand value, $Res Function(WiatagCommand) then) =
      _$WiatagCommandCopyWithImpl<$Res, WiatagCommand>;
  @useResult
  $Res call(
      {@WiatagCommandTypeConverter() WiatagCommandType type,
      String commandId,
      String? message,
      String? title,
      double? latitude,
      double? longitude,
      double? time,
      @MessageDataOrNullConverter() Map<String, dynamic>? messageData,
      bool? state});
}

/// @nodoc
class _$WiatagCommandCopyWithImpl<$Res, $Val extends WiatagCommand>
    implements $WiatagCommandCopyWith<$Res> {
  _$WiatagCommandCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? commandId = null,
    Object? message = freezed,
    Object? title = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? time = freezed,
    Object? messageData = freezed,
    Object? state = freezed,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as WiatagCommandType,
      commandId: null == commandId
          ? _value.commandId
          : commandId // ignore: cast_nullable_to_non_nullable
              as String,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as double?,
      messageData: freezed == messageData
          ? _value.messageData
          : messageData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WiatagCommandImplCopyWith<$Res>
    implements $WiatagCommandCopyWith<$Res> {
  factory _$$WiatagCommandImplCopyWith(
          _$WiatagCommandImpl value, $Res Function(_$WiatagCommandImpl) then) =
      __$$WiatagCommandImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@WiatagCommandTypeConverter() WiatagCommandType type,
      String commandId,
      String? message,
      String? title,
      double? latitude,
      double? longitude,
      double? time,
      @MessageDataOrNullConverter() Map<String, dynamic>? messageData,
      bool? state});
}

/// @nodoc
class __$$WiatagCommandImplCopyWithImpl<$Res>
    extends _$WiatagCommandCopyWithImpl<$Res, _$WiatagCommandImpl>
    implements _$$WiatagCommandImplCopyWith<$Res> {
  __$$WiatagCommandImplCopyWithImpl(
      _$WiatagCommandImpl _value, $Res Function(_$WiatagCommandImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? commandId = null,
    Object? message = freezed,
    Object? title = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? time = freezed,
    Object? messageData = freezed,
    Object? state = freezed,
  }) {
    return _then(_$WiatagCommandImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as WiatagCommandType,
      commandId: null == commandId
          ? _value.commandId
          : commandId // ignore: cast_nullable_to_non_nullable
              as String,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as double?,
      messageData: freezed == messageData
          ? _value._messageData
          : messageData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WiatagCommandImpl implements _WiatagCommand {
  const _$WiatagCommandImpl(
      {@WiatagCommandTypeConverter() required this.type,
      required this.commandId,
      this.message,
      this.title,
      this.latitude,
      this.longitude,
      this.time,
      @MessageDataOrNullConverter() final Map<String, dynamic>? messageData,
      this.state})
      : _messageData = messageData;

  factory _$WiatagCommandImpl.fromJson(Map<String, dynamic> json) =>
      _$$WiatagCommandImplFromJson(json);

  @override
  @WiatagCommandTypeConverter()
  final WiatagCommandType type;
  @override
  final String commandId;
  @override
  final String? message;
  @override
  final String? title;
  @override
  final double? latitude;
  @override
  final double? longitude;
  @override
  final double? time;
  final Map<String, dynamic>? _messageData;
  @override
  @MessageDataOrNullConverter()
  Map<String, dynamic>? get messageData {
    final value = _messageData;
    if (value == null) return null;
    if (_messageData is EqualUnmodifiableMapView) return _messageData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final bool? state;

  @override
  String toString() {
    return 'WiatagCommand(type: $type, commandId: $commandId, message: $message, title: $title, latitude: $latitude, longitude: $longitude, time: $time, messageData: $messageData, state: $state)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WiatagCommandImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.commandId, commandId) ||
                other.commandId == commandId) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.time, time) || other.time == time) &&
            const DeepCollectionEquality()
                .equals(other._messageData, _messageData) &&
            (identical(other.state, state) || other.state == state));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      type,
      commandId,
      message,
      title,
      latitude,
      longitude,
      time,
      const DeepCollectionEquality().hash(_messageData),
      state);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WiatagCommandImplCopyWith<_$WiatagCommandImpl> get copyWith =>
      __$$WiatagCommandImplCopyWithImpl<_$WiatagCommandImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WiatagCommandImplToJson(
      this,
    );
  }
}

abstract class _WiatagCommand implements WiatagCommand {
  const factory _WiatagCommand(
      {@WiatagCommandTypeConverter() required final WiatagCommandType type,
      required final String commandId,
      final String? message,
      final String? title,
      final double? latitude,
      final double? longitude,
      final double? time,
      @MessageDataOrNullConverter() final Map<String, dynamic>? messageData,
      final bool? state}) = _$WiatagCommandImpl;

  factory _WiatagCommand.fromJson(Map<String, dynamic> json) =
      _$WiatagCommandImpl.fromJson;

  @override
  @WiatagCommandTypeConverter()
  WiatagCommandType get type;
  @override
  String get commandId;
  @override
  String? get message;
  @override
  String? get title;
  @override
  double? get latitude;
  @override
  double? get longitude;
  @override
  double? get time;
  @override
  @MessageDataOrNullConverter()
  Map<String, dynamic>? get messageData;
  @override
  bool? get state;
  @override
  @JsonKey(ignore: true)
  _$$WiatagCommandImplCopyWith<_$WiatagCommandImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
