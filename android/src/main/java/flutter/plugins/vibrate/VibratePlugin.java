package flutter.plugins.vibrate;

import android.content.Context;
import android.os.Build;
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

  private VibratePlugin(Registrar registrar){
    this._vibrator = (Vibrator)registrar.context().getSystemService(Context.VIBRATOR_SERVICE);
  }

  private Vibrator _vibrator;

  public static void registerWith(Registrar registrar) {
    final MethodChannel channel = new MethodChannel(registrar.messenger(), "vibrate");
    channel.setMethodCallHandler(new VibratePlugin(registrar));
  }

  @Override
  public void onMethodCall(MethodCall call, Result result) {
    if (call.method.equals("vibrate")) {
      if(_vibrator.hasVibrator()){
        int duration = call.argument("duration");
        _vibrator.vibrate(duration);
      }
      result.success(null);
    }
    else if(call.method.equals("canVibrate")){
      result.success(_vibrator.hasVibrator());
    } //Feedback
    else if(call.method.equals("impact")){
      if(_vibrator.hasVibrator()){
        _vibrator.vibrate(HapticFeedbackConstants.VIRTUAL_KEY);
      }
      result.success(null);
    }
    else if(call.method.equals("selection")){
      if(_vibrator.hasVibrator()){
        _vibrator.vibrate(HapticFeedbackConstants.KEYBOARD_TAP);
      }
      result.success(null);
    }
    else if(call.method.equals("success")){
      if(_vibrator.hasVibrator()){
          int duration = 50;
          _vibrator.vibrate(duration);
      }
      result.success(null);
    }
    else if(call.method.equals("warning")){
      if(_vibrator.hasVibrator()){
          int duration = 250;
          _vibrator.vibrate(duration);
      }
      result.success(null);
    }
    else if(call.method.equals("error")){
      if(_vibrator.hasVibrator()){
          int duration = 500;
          _vibrator.vibrate(duration);
      }
      result.success(null);
    }
    else if(call.method.equals("heavy")){
      if(_vibrator.hasVibrator()){
          int duration = 100;
          _vibrator.vibrate(duration);
      }
      result.success(null);
    }
    else if(call.method.equals("medium")){
      if(_vibrator.hasVibrator()){
          int duration = 40;
          _vibrator.vibrate(duration);
      }
      result.success(null);
    }
    else if(call.method.equals("light")){
      if(_vibrator.hasVibrator()){
          int duration = 10;
          _vibrator.vibrate(duration);
      }
      result.success(null);
    }
    else {
      result.notImplemented();
    }
  }
}
