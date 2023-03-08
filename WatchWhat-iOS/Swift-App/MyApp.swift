//
//  MyApp.swift
//  Swift-App
//
//  Created by Drew Miller on 11/6/22.
//

import SwiftUI

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(ModelData())
        }
    }
}
