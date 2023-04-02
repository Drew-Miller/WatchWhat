//
//  PopularMovies.swift
//  WatchWhat
//
//  Created by Drew Miller on 3/8/23.
//

import Foundation

@MainActor
class HomeViewModel: ObservableObject {
    @Published private(set) var page: Int?
    @Published private(set) var trending: [Media] = [Media]()
    @Published private(set) var discover: [Media] = [Media]()

    func loadData() async {
        Networking.shared.DiscoverQuery { discover in
            self.discover = discover
        }
    }
}
