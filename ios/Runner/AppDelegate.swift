import UIKit
import Flutter
import AVFoundation
import Photos

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {

    private let CHANNEL = "com.app/native_utils"
    private var pendingPermissionResult: FlutterResult? = nil

    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
        let channel = FlutterMethodChannel(name: CHANNEL, binaryMessenger: controller.binaryMessenger)

        channel.setMethodCallHandler({
            [weak self] (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in

            guard let self = self else {
                result(FlutterError(code: "DEALLOCATED", message: "AppDelegate instance deallocated.", details: nil))
                return
            }

            switch call.method {
            case "getStorageInfo":
                self.getStorageInfo(result: result)
            case "requestCameraPermission":
                self.requestCameraPermission(result: result)
            case "showToast":
                self.handleShowToast(call: call, result: result, controller: controller)

            default:
                result(FlutterMethodNotImplemented)
            }
        })

        GeneratedPluginRegistrant.register(with: self)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }

    private func getStorageInfo(result: @escaping FlutterResult) {
        do {
            let fileURL = URL(fileURLWithPath: NSHomeDirectory())
            let values = try fileURL.resourceValues(forKeys: [.volumeTotalCapacityKey, .volumeAvailableCapacityForImportantUsageKey])

            guard let totalCapacity = values.volumeTotalCapacity,
                  let freeCapacity = values.volumeAvailableCapacityForImportantUsage else {
                result(FlutterError(code: "STORAGE_ERROR", message: "Could not retrieve capacity info.", details: nil))
                return
            }

            result([
                "totalBytes": totalCapacity,
                "freeBytes": freeCapacity
            ])

        } catch {
            result(FlutterError(code: "STORAGE_ERROR", message: "Failed to get storage info: \(error.localizedDescription)", details: nil))
        }
    }

    private func requestCameraPermission(result: @escaping FlutterResult) {
        self.pendingPermissionResult = result // حفظ النتيجة لـ Flutter

        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .authorized:
            result("granted")
        case .denied, .restricted:
            result("denied")
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video) { granted in
                DispatchQueue.main.async {
                    if granted {
                        self.pendingPermissionResult?("granted")
                    } else {
                        self.pendingPermissionResult?("denied")
                    }
                    self.pendingPermissionResult = nil
                }
            }
        @unknown default:
            result(FlutterError(code: "UNKNOWN_PERMISSION_STATUS", message: "Unknown camera permission status.", details: nil))
        }
    }

    // MARK: - Bonus Task: Show Toast Handler
    private func handleShowToast(call: FlutterMethodCall, result: @escaping FlutterResult, controller: FlutterViewController) {
        guard let args = call.arguments as? [String: Any],
              let message = args["message"] as? String else {
            result(FlutterError(code: "ARG_ERROR", message: "Message argument is missing or invalid.", details: nil))
            return
        }

        let duration = args["duration"] as? Int ?? 2

        DispatchQueue.main.async {
            self.showNativeToast(message: message, duration: TimeInterval(duration), controller: controller)
        }

        result(nil)
    }

    private func showNativeToast(message: String, duration: TimeInterval, controller: UIViewController) {
        guard controller.presentedViewController == nil else {
            print("Toast request ignored: Another view controller is already being presented.")
            return
        }

        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)

        DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
            DispatchQueue.main.async {
                if alert.presentingViewController != nil {
                     alert.dismiss(animated: true, completion: nil)
                }
            }
        }

        controller.present(alert, animated: true, completion: nil)
    }
}
