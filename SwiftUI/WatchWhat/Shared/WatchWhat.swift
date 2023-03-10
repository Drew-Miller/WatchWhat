//
//  File.swift
//  WatchWhat
//
//  Created by Drew Miller on 3/8/23.
//

import Foundation
import Apollo

class WatchWhat {    
    static let apolloClient: ApolloClient = ApolloClient(url: Configuration.baseURL)
    
    private init() {}
}
