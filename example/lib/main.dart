import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vibrate/vibrate.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  initState() {
    super.initState();
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
                onTap:(){Vibrate.vibrate(new Duration(milliseconds: 2000));},
                title: new Text("Vibrate 2 sec")),
              new ListTile(
                leading: new Icon(Icons.cancel, color: Colors.red),
                onTap: (){Vibrate.cancel();},
                title: new Text("Cancel")),
            ]),
        ),
      ),
    );
  }
}
