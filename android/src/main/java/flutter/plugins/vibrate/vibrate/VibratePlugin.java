package flutter.plugins.vibrate.vibrate;

import android.content.Context;
import android.os.Build;
import android.os.Vibrator;

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
    final MethodChannel channel = new MethodChannel(registrar.messenger(), "github.com/clovisnicolas/flutter_vibrate");
    channel.setMethodCallHandler(new VibratePlugin(registrar));
  }

  @Override
  public void onMethodCall(MethodCall call, Result result) {
    switch (call.method) {
      case "vibrate":
        if (_vibrator.hasVibrator()) {
          int duration = call.argument("duration");
          _vibrator.vibrate(duration);
        }
        result.success(null);
        break;
      case "canVibrate":
        result.success(_vibrator.hasVibrator());
        break;
      case "cancel":
        if (_vibrator.hasVibrator()) {
          _vibrator.cancel();
        }
        result.success(null);
        break;
      default:
        result.notImplemented();
        break;
    }
  }
}
