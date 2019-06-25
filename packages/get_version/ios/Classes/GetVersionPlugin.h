#import <Flutter/Flutter.h>

@interface GetVersionPlugin : NSObject<FlutterPlugin>
@end

@interface NSBundle (Versions)

- (NSString *)releaseVersionNumber;
- (NSString *)buildVersionNumber;

@end
