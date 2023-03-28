//
//  UserDefaultsKeys.swift
//  WatchWhat.iOS
//
//  Created by Drew Miller on 3/27/23.
//

import Foundation

extension String {
    static let keys = UserDefaultsKey()
    
    class UserDefaultsKey {
        let token: String = "token"
    }
}
