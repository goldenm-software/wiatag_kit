#import "WiatagKitPlugin.h"

@implementation WiatagKitPlugin
NSString *HOST = @"";
NSNumber *PORT = 0;
NSString *UNIT_ID = @"";
NSString *PASSWORD = @"";
int COMMAND_SYNC = 30;
BOOL HAS_COMMANDS = YES;
WTMessageManager *SENDER;

+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"wiatag_kit"
            binaryMessenger:[registrar messenger]];
  WiatagKitPlugin* instance = [[WiatagKitPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"setServer" isEqualToString:call.method]) {
      [self setServer:call.arguments result:result];
  } else if ([@"getServer" isEqualToString:call.method]) {
      [self getServer:result];
  } else if ([@"sendSos" isEqualToString:call.method]) {
      [self sendSos:call.arguments result:result];
  } else if ([@"sendMessage" isEqualToString:call.method]) {
      [self sendMessage:call.arguments result:result];
  } else if ([@"sendText" isEqualToString:call.method]) {
      [self sendText:call.arguments result:result];
  } else {
    result(FlutterMethodNotImplemented);
  }
}

- (void)setServer:(NSDictionary*)args result:(FlutterResult)result {
    HOST = args[@"host"];
    PORT = args[@"port"];
    UNIT_ID = args[@"unitId"];
    PASSWORD = args[@"password"];
    HAS_COMMANDS = args[@"hasCommands"];
    id _Nullable syncTime = args[@"commandListener"];
    if (syncTime != nil) {
        COMMAND_SYNC = [syncTime intValue];
    }
    
    // Return true
    result([NSNumber numberWithBool: YES]);
    
    // Start WiaTag Service
    SENDER = [[WTMessageManager alloc] initWithHost:HOST port:[PORT unsignedLongValue] deviceId:UNIT_ID password:PASSWORD];
}

- (void)getServer:(FlutterResult)result {
    NSDictionary *server = @{
        @"host": HOST,
        @"port": PORT,
        @"unitId": UNIT_ID,
        @"password": PASSWORD,
        @"hasCommands": [NSNumber numberWithBool: HAS_COMMANDS],
        @"commandListener": [NSNumber numberWithInt: COMMAND_SYNC]
    };
    result(server);
}

- (void)sendMessage:(NSDictionary*)args result:(FlutterResult)result {
    WTMessage *msg = [[WTMessage alloc] initWithBlock:^(WTMessageBuilder * _Nonnull builder) {
        [builder setTime: [NSDate date]];

        [self composeMessage:args builder:builder];
    }];
    
    [SENDER sendMessage:msg completion:^(NSError * _Nonnull error){
        if (error != nil) {
            result([NSNumber numberWithBool: NO]);
        } else {
            result([NSNumber numberWithBool: YES]);
        }
    }];
}

- (void)sendSos:(NSDictionary*)args result:(FlutterResult)result {
    WTMessage *msg = [[WTMessage alloc] initWithBlock:^(WTMessageBuilder * _Nonnull builder) {
        [builder setTime: [NSDate date]];
        [builder setIsSos: YES];
        [self composeMessage:args builder:builder];
    }];
    
    [SENDER sendMessage:msg completion:^(NSError * _Nonnull error){
        if (error != nil) {
            result([NSNumber numberWithBool: NO]);
        } else {
            result([NSNumber numberWithBool: YES]);
        }
    }];
}

- (void)sendText:(NSDictionary*)args result:(FlutterResult)result {
    WTMessage *msg = [[WTMessage alloc] initWithBlock:^(WTMessageBuilder * _Nonnull builder) {
        [builder setTime: [NSDate date]];
        
        // Get message from args, may be null
        [self composeMessage:[args objectForKey: @"message"] builder:builder];
        
        NSString* text = [args objectForKey: @"text"];
        if (text != nil) {
            builder.text = text;
        }
    }];
    
    [SENDER sendMessage:msg completion:^(NSError * _Nonnull error){
        if (error != nil) {
            result([NSNumber numberWithBool: NO]);
        } else {
            result([NSNumber numberWithBool: YES]);
        }
    }];
}

- (void)composeMessage:(NSDictionary*)args builder:(WTMessageBuilder * _Nonnull)builder {
    // Check if args is nil
    if (args == nil) {
        return;
    }
    
    // Get latitude (double), longitude (double), altitude (double), speed (double)
    // direction (double) and satellites (int) from args
    // In case some is nill, set to 0
    NSNumber *latitude = args[@"latitude"];
    NSNumber *longitude = args[@"longitude"];
    NSNumber *altitude = args[@"altitude"];
    NSNumber *speed = args[@"speed"];
    NSNumber *direction = args[@"direction"];
    NSNumber *satellites = args[@"satellites"];
    if (latitude == nil) {
        latitude = [NSNumber numberWithDouble: 0];
    }
    if (longitude == nil) {
        longitude = [NSNumber numberWithDouble: 0];
    }
    if (altitude == nil) {
        altitude = [NSNumber numberWithDouble: 0];
    }
    if (speed == nil) {
        speed = [NSNumber numberWithDouble: 0];
    }
    if (direction == nil) {
        direction = [NSNumber numberWithDouble: 0];
    }
    if (satellites == nil) {
        satellites = [NSNumber numberWithInt: 0];
    }
    
    WTLocation *location = [[WTLocation alloc] initWithLatitude: [latitude doubleValue]
                                                      longitude: [longitude doubleValue]
                                                       altitude: [altitude doubleValue]
                                                          speed: [speed unsignedIntValue]
                                                        bearing: [direction unsignedIntValue]
                                                     satellites: [satellites unsignedIntValue]];
    
    [builder setLocation: location];
    
//    NSNumber* batteryLevel = [args objectForKey: @"battery.level"];
//    if (batteryLevel != nil) {
//        [builder setBatteryLevel: batteryLevel];
//    }
//    
//    NSString* driverMessage = [args objectForKey: @"driver.message"];
//    if (driverMessage != nil) {
//        [builder setText: driverMessage];
//    }
//    
//    for (NSString* key in args) {
//        id value = [args objectForKey: key];
//
//        if ([value isKindOfClass: [NSString class]]) {
//            [builder addParam: key withText: value];
//        } else if ([value isKindOfClass: [NSNumber class]]) {
//            [builder addParam:key withFloatValue: value];
//        }
//    }
}
@end
