import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vibrate/vibrate.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {

  bool _canVibrate = true;

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
            ]),
        ),
      ),
    );
  }
}
