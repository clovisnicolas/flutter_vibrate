import 'dart:io';

import 'package:flutter/material.dart';
import 'package:vibrate/vibrate.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _canVibrate = true;

  final Iterable<Duration> _pauses = const [
    const Duration(milliseconds: 500),
    const Duration(milliseconds: 1000),
    const Duration(milliseconds: 500),
  ];

  bool _supportsCustomDuration = false;

  Duration _duration = const Duration(milliseconds: 1000);

  @override
  initState() {
    super.initState();
    init();
  }

  init() async {
    bool canVibrate = await Vibrate.canVibrate;
    setState(() {
      _canVibrate = canVibrate;
      _supportsCustomDuration = Platform.operatingSystem == "android";
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(title: new Text('Plugin example app')),
        body: new Center(
          child: new Column(children: <Widget>[
            new ListTile(
                leading: new Icon(Icons.vibration, color: Colors.teal),
                onTap: _canVibrate
                    ? () {
                        if (_supportsCustomDuration) {
                          Vibrate.vibrate(duration: _duration);
                        } else {
                          Vibrate.vibrate();
                        }
                      }
                    : null,
                title: new Text("Vibrate"),
                subtitle: _supportsCustomDuration
                    ? new Row(children: <Widget>[
                        new Slider(
                            min: 500.0,
                            max: 5000.0,
                            value: _duration.inMilliseconds.roundToDouble(),
                            onChanged: (double value) {
                              setState(() {
                                _duration = new Duration(milliseconds: value.round());
                              });
                            }),
                        new Text("${_duration.inMilliseconds} ms"),
                      ])
                    : null),
            new ListTile(
                leading: new Icon(Icons.vibration, color: Colors.blue),
                onTap: _canVibrate
                    ? () {
                        Vibrate.vibrateWithPauses(_pauses);
                      }
                    : null,
                title: new Text("Vibrate with pauses")),
          ]),
        ),
      ),
    );
  }
}
