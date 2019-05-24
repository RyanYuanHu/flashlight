import 'dart:async';

import 'package:flutter/services.dart';

class Flashlight {
  static const MethodChannel _channel = const MethodChannel('flashlight');

  static Future<bool> get hasFlashlight async {
    final bool _hasFlashlight = await _channel.invokeMethod('hasFlashlight');
    return _hasFlashlight;
  }

  static Future<void> lightOn() async {
    await _channel.invokeMethod('lightOn');
    return;
  }

  static Future<void> lightOff() async {
    await _channel.invokeMethod('lightOff');
    return;
  }
}
