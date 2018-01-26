import 'package:flutter/material.dart';
import 'package:vibrate/vibrate.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
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

  init() async{
    bool canVibrate = await Vibrate.canVibrate;
    setState((){_canVibrate = canVibrate;});
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(title: new Text('Plugin example app')),
        body: new Center(
          child: new Column(
            children: <Widget>[
              new ListTile(
                leading: new Icon(Icons.vibration, color: Colors.teal),
                onTap: _canVibrate ?(){Vibrate.vibrate();} : null,
                title: new Text("Vibrate")),
              new ListTile(
                  leading: new Icon(Icons.vibration, color: Colors.blue),
                  onTap: _canVibrate ?(){Vibrate.vibrateWithPauses(pauses);} : null,
                  title: new Text("Vibrate with pauses")),
            ]),
        ),
      ),
    );
  }
}
