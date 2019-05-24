#import "FlashlightPlugin.h"
#import <flashlight/flashlight-Swift.h>

@implementation FlashlightPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlashlightPlugin registerWithRegistrar:registrar];
}
@end
