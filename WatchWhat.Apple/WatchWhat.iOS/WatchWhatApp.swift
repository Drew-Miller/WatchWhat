//
//  WatchWhatApp.swift
//  WatchWhat
//
//  Created by Drew Miller on 3/7/23.
//

import SwiftUI

@main
struct WatchWhatApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @State var isActive: Bool = false
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                if self.isActive {
                    AuthenticatedView {
                        ContentView()
                    }
                } else {
                    SplashView()
                }
            }
            .preferredColorScheme(.dark)
            .onAppear {
                // Sets the wait time, should be based on performance
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        }
    }
}
