import Flutter
import UIKit

public class SwiftAwesomeRiveButtonsPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "awesome_rive_buttons", binaryMessenger: registrar.messenger())
    let instance = SwiftAwesomeRiveButtonsPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result("iOS " + UIDevice.current.systemVersion)
  }
}
