#import "VibratePlugin.h"
#import <vibrate/vibrate-Swift.h>

@implementation VibratePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftVibratePlugin registerWithRegistrar:registrar];
}
@end
