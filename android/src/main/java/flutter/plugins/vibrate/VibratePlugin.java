package flutter.plugins.vibrate;

import android.content.Context;
import android.os.Build;
import android.os.VibrationEffect;
import android.os.Vibrator;
import android.view.HapticFeedbackConstants;

import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.PluginRegistry.Registrar;

/**
 * VibratePlugin
 */
public class VibratePlugin implements MethodCallHandler {

  private VibratePlugin(Registrar registrar) {
    this._vibrator = (Vibrator) registrar.context().getSystemService(Context.VIBRATOR_SERVICE);
  }

  private Vibrator _vibrator;

  public static void registerWith(Registrar registrar) {
    final MethodChannel channel = new MethodChannel(registrar.messenger(), "vibrate");
    channel.setMethodCallHandler(new VibratePlugin(registrar));
  }

  @Override
  @SuppressWarnings("deprecation")
  public void onMethodCall(MethodCall call, Result result) {
    if (call.method.equals("vibrate")) {
      if (_vibrator.hasVibrator()) {
        int duration = call.argument("duration");
        if (Build.VERSION.SDK_INT >= 26) {
          _vibrator.vibrate(VibrationEffect.createOneShot(duration, VibrationEffect.DEFAULT_AMPLITUDE));
        } else {
          _vibrator.vibrate(duration);
        }
      }
      result.success(null);
    } else if (call.method.equals("canVibrate")) {
      result.success(_vibrator.hasVibrator());
    } // Feedback
    else if (call.method.equals("impact")) {
      if (_vibrator.hasVibrator()) {
        if (Build.VERSION.SDK_INT >= 26) {
          _vibrator.vibrate(
              VibrationEffect.createOneShot(HapticFeedbackConstants.VIRTUAL_KEY, VibrationEffect.DEFAULT_AMPLITUDE));
        } else {
          _vibrator.vibrate(HapticFeedbackConstants.VIRTUAL_KEY);
        }
      }
      result.success(null);
    } else if (call.method.equals("selection")) {
      if (_vibrator.hasVibrator()) {
        if (Build.VERSION.SDK_INT >= 26) {
          _vibrator.vibrate(
              VibrationEffect.createOneShot(HapticFeedbackConstants.KEYBOARD_TAP, VibrationEffect.DEFAULT_AMPLITUDE));
        } else {
          _vibrator.vibrate(HapticFeedbackConstants.KEYBOARD_TAP);
        }
      }
      result.success(null);
    } else if (call.method.equals("success")) {
      if (_vibrator.hasVibrator()) {
        int duration = 50;
        if (Build.VERSION.SDK_INT >= 26) {
          _vibrator.vibrate(VibrationEffect.createOneShot(duration, VibrationEffect.DEFAULT_AMPLITUDE));
        } else {
          _vibrator.vibrate(duration);
        }
      }
      result.success(null);
    } else if (call.method.equals("warning")) {
      if (_vibrator.hasVibrator()) {
        int duration = 250;
        if (Build.VERSION.SDK_INT >= 26) {
          _vibrator.vibrate(VibrationEffect.createOneShot(duration, VibrationEffect.DEFAULT_AMPLITUDE));
        } else {
          _vibrator.vibrate(duration);
        }
      }
      result.success(null);
    } else if (call.method.equals("error")) {
      if (_vibrator.hasVibrator()) {
        int duration = 500;
        if (Build.VERSION.SDK_INT >= 26) {
          _vibrator.vibrate(VibrationEffect.createOneShot(duration, VibrationEffect.DEFAULT_AMPLITUDE));
        } else {
          _vibrator.vibrate(duration);
        }
      }
      result.success(null);
    } else if (call.method.equals("heavy")) {
      if (_vibrator.hasVibrator()) {
        int duration = 100;
        if (Build.VERSION.SDK_INT >= 26) {
          _vibrator.vibrate(VibrationEffect.createOneShot(duration, VibrationEffect.DEFAULT_AMPLITUDE));
        } else {
          _vibrator.vibrate(duration);
        }
      }
      result.success(null);
    } else if (call.method.equals("medium")) {
      if (_vibrator.hasVibrator()) {
        int duration = 40;
        if (Build.VERSION.SDK_INT >= 26) {
          _vibrator.vibrate(VibrationEffect.createOneShot(duration, VibrationEffect.DEFAULT_AMPLITUDE));
        } else {
          _vibrator.vibrate(duration);
        }
      }
      result.success(null);
    } else if (call.method.equals("light")) {
      if (_vibrator.hasVibrator()) {
        int duration = 10;
        if (Build.VERSION.SDK_INT >= 26) {
          _vibrator.vibrate(VibrationEffect.createOneShot(duration, VibrationEffect.DEFAULT_AMPLITUDE));
        } else {
          _vibrator.vibrate(duration);
        }
      }
      result.success(null);
    } else {
      result.notImplemented();
    }
  }
}
