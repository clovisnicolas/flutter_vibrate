#import "VibratePlugin.h"
#import <AudioToolbox/AudioServices.h>

@implementation VibratePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"github.com/clovisnicolas/flutter_vibrate"
            binaryMessenger:[registrar messenger]];
  VibratePlugin* instance = [[VibratePlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"vibrate" isEqualToString:call.method]) {
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
    result(nil);
  }
  else if ([@"canVibrate" isEqualToString:call.method]){
    result([NSNumber numberWithBool:YES]);
  }
  else if ([@"cancel" isEqualToString:call.method]){
    //TODO add cancel functionality to iOS
    result(nil);
  }
  else {
    result(FlutterMethodNotImplemented);
  }
}

@end
