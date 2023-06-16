//
//  WatchWhatApp.swift
//  WatchWhat
//
//  Created by Drew Miller on 3/7/23.
//

import SwiftUI

@main
struct WatchWhatApp: App {
    // @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @State var isActive: Bool = false
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                if self.isActive {
//                    AuthenticatedView {
//                        ContentView()
//                    }
                    
                    ContentView()
                } else {
                    SplashView()
                }
            }
        }
    }
}
