import UIKit
import Flutter
import FirebaseCore
import FirebaseMessaging
@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        FirebaseApp.configure()
        GeneratedPluginRegistrant.register(with: self)
        
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
//    override func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
//        print("vsdvsdvdsvdsvd")
//        print(deviceToken)
//        Messaging.messaging().apnsToken = deviceToken
//       super.application(application, didRegisterForRemoteNotificationsWithDeviceToken: deviceToken)
//     }
}
