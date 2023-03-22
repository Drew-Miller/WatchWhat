//
//  WatchWhatAppDelegate.swift
//  WatchWhat
//
//  Created by Drew Miller on 3/19/23.
//

import SwiftUI
import Firebase
import FirebaseCore
import FirebaseAuth

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
      if let emulator = Configuration.emaulatorSettings {
          Auth.auth().useEmulator(withHost: emulator.host, port: emulator.port)
      }

    return true
  }
}
