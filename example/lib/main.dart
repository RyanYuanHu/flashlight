import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flashlight/flashlight.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _hasFlashlight = false;

  @override
  initState() {
    super.initState();
    initFlashlight();
  }

  initFlashlight() async {
    bool hasFlash = await Flashlight.hasFlashlight;
    print("Device has flash ? $hasFlash");
    setState(() {
      _hasFlashlight = hasFlash;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flashlight Plugin example app'),
        ),
        body: Center(
            child: Column(
          children: <Widget>[
            Text(_hasFlashlight
                ? 'Your phone has a Flashlight.'
                : 'Your phone has no Flashlight.'),
            RaisedButton(
              child: Text('Turn on'),
              onPressed: () => Flashlight.lightOn(),
            ),
            RaisedButton(
              child: Text('Turn off'),
              onPressed: () => Flashlight.lightOff(),
            )
          ],
        )),
      ),
    );
  }
}
