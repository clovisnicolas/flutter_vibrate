import 'dart:async';

import 'package:flutter/services.dart';

class Vibrate {
  static const MethodChannel _channel = const MethodChannel('github.com/clovisnicolas/flutter_vibrate');
  static Future vibrate(Duration duration) => _channel.invokeMethod('vibrate', {"duration" : duration.inMilliseconds});
  static Future cancel() => _channel.invokeMethod('cancel');
}
