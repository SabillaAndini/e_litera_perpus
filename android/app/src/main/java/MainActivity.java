import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel;

public class MainActivity extends FlutterActivity {
    private static final String CHANNEL = "midpay";

    @Override
    public void configureFlutterEngine(FlutterEngine flutterEngine) {
        super.configureFlutterEngine(flutterEngine);

        new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), CHANNEL)
                .setMethodCallHandler(
                        (call, result) -> {
                            if (call.method.equals("init")) {
                                // Implement init method logic here
                                result.success(null); // or result.error()
                            } else if (call.method.equals("payment")) {
                                // Implement payment method logic here
                                result.success(null); // or result.error()
                            } else {
                                result.notImplemented();
                            }
                        }
                );
    }
}
