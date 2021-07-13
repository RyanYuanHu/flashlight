import 'package:flashlight/flashlight.dart';
import 'package:flutter/material.dart';

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
            Text(_hasFlashlight!
                ? 'Your phone has a Flashlight.'
                : 'Your phone has no Flashlight.'),
            ElevatedButton(
              child: Text('Turn on'),
              onPressed: () => Flashlight.lightOn(),
            ),
            ElevatedButton(
              child: Text('Turn off'),
              onPressed: () => Flashlight.lightOff(),
            )
          ],
        )),
      ),
    );
  }
}
