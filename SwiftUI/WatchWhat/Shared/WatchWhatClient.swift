//
//  File.swift
//  WatchWhat
//
//  Created by Drew Miller on 3/8/23.
//

import Foundation
import Apollo

class WhatchWhatClient {
    static let apollo: ApolloClient = ApolloClient(url: Configuration.baseURL)
    
    private init() {}
}
