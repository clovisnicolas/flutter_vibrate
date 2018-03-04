import 'dart:async';

import 'package:flutter/services.dart';

class Vibrate {
  static const MethodChannel _channel = const MethodChannel('github.com/clovisnicolas/flutter_vibrate');
  static const Duration _DEFAULT_VIBRATION_DURATION = const Duration(milliseconds: 500);

  //Vibrate for 500ms on Android, and for the default time on iOS (about 500ms as well)
  static Future vibrate([Duration duration = _DEFAULT_VIBRATION_DURATION]) => _channel.invokeMethod('vibrate', {"duration": duration.inMilliseconds});
  //Whether the device can actually vibrate or not
  static Future<bool> get canVibrate => _channel.invokeMethod('canVibrate');
  /**
  Vibrates with [pauses] in between each vibration
  Will always vibrate once before the first pause
  and once after the last pause
  **/
  static Future vibrateWithPauses(Iterable<Duration> pauses) async{
    for (Duration d in pauses){
        vibrate();
        //Because the native vibration is not awaited, we need to wait for
        //the vibration to end before launching another one
        await new Future.delayed(_DEFAULT_VIBRATION_DURATION);
        await new Future.delayed(d);
    }
    vibrate();
  }
}
