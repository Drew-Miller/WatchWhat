//
//  WatchWhatApp.swift
//  WatchWhat
//
//  Created by Drew Miller on 3/7/23.
//

import SwiftUI

@main
struct WatchWhatApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(ModelData())
        }
    }
}
