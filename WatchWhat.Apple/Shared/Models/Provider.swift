//
//  WatchProvider.swift
//  WatchWhat
//
//  Created by Drew Miller on 3/11/23.
//

import Foundation

struct Providers {
    let link: String
    let buy: [Provider]?
    let rent: [Provider]?
    let flatrate: [Provider]?
}

struct Provider: Hashable {
    let id: Int
    let name: String
    let displayPriority: Int
    let logo: String?
}
