import 'package:flutter/material.dart';
import 'package:vibrate/vibrate.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _canVibrate = true;
  final Iterable<Duration> pauses = [
    const Duration(milliseconds: 500),
    const Duration(milliseconds: 1000),
    const Duration(milliseconds: 500),
  ];

  @override
  initState() {
    super.initState();
    init();
  }

  init() async {
    bool canVibrate = await Vibrate.canVibrate;
    setState(() {
      _canVibrate = canVibrate;
      _canVibrate
          ? print("This device can vibrate")
          : print("This device cannot vibrate");
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Haptic Feedback Example')),
        body: Center(
          child: ListView(children: [
            ListTile(
              title: Text("Vibrate"),
              leading: Icon(Icons.vibration, color: Colors.teal),
              onTap: !_canVibrate
                  ? null
                  : () {
                      Vibrate.vibrate();
                    },
            ),
            ListTile(
              title: Text("Vibrate with Pauses"),
              leading: Icon(Icons.vibration, color: Colors.brown),
              onTap: !_canVibrate
                  ? null
                  : () {
                      Vibrate.vibrateWithPauses(pauses);
                    },
            ),
            Divider(height: 1.0),
            ListTile(
              title: Text("Impact"),
              leading: Icon(Icons.tap_and_play, color: Colors.orange),
              onTap: !_canVibrate
                  ? null
                  : () {
                      Vibrate.feedback(FeedbackType.impact);
                    },
            ),
            ListTile(
              title: Text("Selection"),
              leading: Icon(Icons.select_all, color: Colors.blue),
              onTap: !_canVibrate
                  ? null
                  : () {
                      Vibrate.feedback(FeedbackType.selection);
                    },
            ),
            ListTile(
              title: Text("Success"),
              leading: Icon(Icons.check, color: Colors.green),
              onTap: !_canVibrate
                  ? null
                  : () {
                      Vibrate.feedback(FeedbackType.success);
                    },
            ),
            ListTile(
              title: Text("Warning"),
              leading: Icon(Icons.warning, color: Colors.red),
              onTap: !_canVibrate
                  ? null
                  : () {
                      Vibrate.feedback(FeedbackType.warning);
                    },
            ),
            ListTile(
              title: Text("Error"),
              leading: Icon(Icons.error, color: Colors.red),
              onTap: !_canVibrate
                  ? null
                  : () {
                      Vibrate.feedback(FeedbackType.error);
                    },
            ),
            Divider(height: 1.0),
            ListTile(
              title: Text("Heavy"),
              leading: Icon(Icons.notification_important, color: Colors.red),
              onTap: !_canVibrate
                  ? null
                  : () {
                      Vibrate.feedback(FeedbackType.heavy);
                    },
            ),
            ListTile(
              title: Text("Medium"),
              leading: Icon(Icons.notification_important, color: Colors.green),
              onTap: !_canVibrate
                  ? null
                  : () {
                      Vibrate.feedback(FeedbackType.medium);
                    },
            ),
            ListTile(
              title: Text("Light"),
              leading:
                  Icon(Icons.notification_important, color: Colors.yellow[700]),
              onTap: !_canVibrate
                  ? null
                  : () {
                      Vibrate.feedback(FeedbackType.light);
                    },
            ),
          ]),
        ),
      ),
    );
  }
}
