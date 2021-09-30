package flutter.plugins.vibrate;

import android.content.Context;
import android.os.Vibrator;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MethodChannel;

public class VibratePlugin implements FlutterPlugin {
    private MethodChannel methodChannel;

    @Override
    public void onAttachedToEngine(FlutterPluginBinding binding) {
        final Context context = binding.getApplicationContext();
        final BinaryMessenger messenger = binding.getBinaryMessenger();
        final Vibrator vibrator = (Vibrator) context.getSystemService(Context.VIBRATOR_SERVICE);
        final VibrateMethodCallHandler methodCallHandler = new VibrateMethodCallHandler(vibrator);

        this.methodChannel = new MethodChannel(messenger, "vibrate");
        this.methodChannel.setMethodCallHandler(methodCallHandler);
    }

    @Override
    public void onDetachedFromEngine(FlutterPluginBinding binding) {
        this.methodChannel.setMethodCallHandler(null);
        this.methodChannel = null;
    }
}
