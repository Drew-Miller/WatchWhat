//
//  UserDefaultsKeys.swift
//  WatchWhat.iOS
//
//  Created by Drew Miller on 3/27/23.
//

import Foundation
import SwiftUI

extension String {
    static let defaultKeys = UserDefaultKeys()
    
    class UserDefaultKeys {
        let region: String                  = "region"
        let token: String                   = "token"
        let presentingLoginScreen: String   = "presentingLoginScreen"
    }
}

@MainActor
class AppState: ObservableObject {
    // App State is initialized here.
    // Using AppStorage attributes in views will override the default app view.
    @AppStorage(.defaultKeys.region) private(set) var region: String? = "US"
    @AppStorage(.defaultKeys.token) private(set) var token: String?
    @AppStorage(.defaultKeys.presentingLoginScreen) var presentingLoginScreen: Bool = false
}

