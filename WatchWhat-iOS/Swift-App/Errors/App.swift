//
//  App.swift
//  Swift-App
//
//  Created by Drew Miller on 11/7/22.
//

import Foundation

extension String: LocalizedError {
    public var errorDescription: String? { return self }
}
