#import "VibratePlugin.h"
#import <flutter_vibrate/flutter_vibrate-Swift.h>

@implementation VibratePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftVibratePlugin registerWithRegistrar:registrar];
}
@end
