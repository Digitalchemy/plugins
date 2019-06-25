#import "GetVersionPlugin.h"

@implementation GetVersionPlugin

+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
    FlutterMethodChannel * channel =
    [FlutterMethodChannel methodChannelWithName:@"get_version"
                                binaryMessenger:[registrar messenger]];
    GetVersionPlugin * instance = [GetVersionPlugin new];
    [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
    if ([call.method isEqualToString:@"getPlatformVersion"]) {
        NSString * version = [NSString stringWithFormat:@"iOS %@", UIDevice.currentDevice.systemVersion];
        result(version);
    } else {
        result(FlutterMethodNotImplemented);
    }
}

@end



@implementation NSBundle (Versions)

- (NSString *)releaseVersionNumber {
    return self.infoDictionary[@"CFBundleShortVersionString"];
}

- (NSString *)buildVersionNumber {
    return self.infoDictionary[@"CFBundleVersion"];
}

@end
