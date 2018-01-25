# Vibrate
[![pub package](https://img.shields.io/pub/v/vibrate.svg)](https://pub.dartlang.org/packages/vibrate)
A Flutter plugin to vibrate the device.

## Usage
To use this plugin, add `vibrate` as a [dependency in your pubspec.yaml file](https://flutter.io/platform-plugins/).

Make sure you add the following permissions to your Android Manifest
```
<uses-permission android:name="android.permission.VIBRATE" />
```

## Example
``` dart
// Import package
import 'package:vibrate/vibrate.dart';

// Check if the device can vibrate
bool canVibrate = await Vibrate.canVibrate;

// Vibrate
Vibrate.vibrate()

```
Vibration duration is a constant 500ms because it cannot be set to a specific duration on iOS.
