import 'dart:async';

import 'package:flutter/services.dart';

class Vibrate {
  static const MethodChannel _channel = const MethodChannel('github.com/clovisnicolas/flutter_vibrate');
  static Future vibrate() => _channel.invokeMethod('vibrate');
  static Future<bool> get canVibrate => _channel.invokeMethod('canVibrate');
}
