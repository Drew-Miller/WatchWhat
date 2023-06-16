//
//  Configuration.swift
//  WatchWhat
//
//  Created by Drew Miller on 3/10/23.
//

import Foundation

enum FromBundle {
    enum Error: Swift.Error {
        case missingKey, invalidValue
    }

    static func value<T>(for key: String) throws -> T where T: LosslessStringConvertible {
        guard let object = Bundle.main.object(forInfoDictionaryKey:key) else {
            throw Error.missingKey
        }

        switch object {
        case let value as T:
            return value
        case let string as String:
            guard let value = T(string) else { fallthrough }
            return value
        default:
            throw Error.invalidValue
        }
    }
}

struct FirebaseEmulator {
    let host: String
    let port: Int
}

enum Configuration {
    static var emaulatorSettings: FirebaseEmulator? {
        do {
            let emulator: String = try FromBundle.value(for: "Emulator")
            let emulatorPort: Int = try FromBundle.value(for: "EmulatorPort")
            return FirebaseEmulator(host: emulator, port: emulatorPort)
        } catch {
            return nil
        }
    }
    
    static var baseURL: URL {
        return try! URL(string: FromBundle.value(for: "BaseUrl"))!
    }
    
    static var imgUrlStr: String {
        return "https://image.tmdb.org/t/p/w500/"
    }
    
    static var originalImgUrlStr: String {
        return "https://image.tmdb.org/t/p/original"
    }
    
    static var offline: Bool {
        return try! Bool(FromBundle.value(for: "offline"))!
    }
}
