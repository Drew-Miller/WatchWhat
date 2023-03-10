//
//  WatchWhatApp.swift
//  WatchWhat
//
//  Created by Drew Miller on 3/7/23.
//

import SwiftUI

@main
struct WatchWhatApp: App {
    @State var isActive: Bool = false

    var body: some Scene {
        WindowGroup {
            ZStack {
                if self.isActive {
                    ContentView()
                        .environmentObject(ModelData())
                } else {
                    SplashView()
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        }
    }
}
