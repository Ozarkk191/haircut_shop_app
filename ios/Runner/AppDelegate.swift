import UIKit
import Flutter
import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
//    key p'toon
    GMSServices.provideAPIKey("AIzaSyCKG8nw3AYLG-qInAtADKR9nf0nPDWaqnI")
    
//    key haircut
//    GMSServices.provideAPIKey("AIzaSyBnUzA1HcLhy28mmN0LT6gpMFF75mq0n0c")
    
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
