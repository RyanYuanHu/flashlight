import Flutter
import UIKit
import AVFoundation

public class SwiftFlashlightPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flashlight", binaryMessenger: registrar.messenger())
    let instance = SwiftFlashlightPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch (call.method) {
    case "hasFlashlight":
        result(self.hasFlashlight())
        break
    case "lightOn":
        self.toggleFlash(on: true)
        result(nil)
        break
    case "lightOff":
        self.toggleFlash(on: false)
        result(nil)
        break
    default:
        result(FlutterMethodNotImplemented)
        break
    }
    
  }
    
    private func hasFlashlight () -> Bool{
        guard let device = AVCaptureDevice.default(for: AVMediaType.video) else { return false}
        return device.hasTorch
    }
    
    private func toggleFlash(on: Bool) {
        guard let device = AVCaptureDevice.default(for: AVMediaType.video) else { return }
        guard device.hasTorch else { return }
        
        do {
            try device.lockForConfiguration()
            if (on && device.torchMode == AVCaptureDevice.TorchMode.off) {
                do {
                    try device.setTorchModeOn(level: 1.0)
                } catch {
                    print(error)
                }
            } else if (!on && device.torchMode == AVCaptureDevice.TorchMode.on) {
                device.torchMode = AVCaptureDevice.TorchMode.off
            }
            
            device.unlockForConfiguration()
        } catch {
            print(error)
        }
    }
}
