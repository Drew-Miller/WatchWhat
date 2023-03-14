//
//  ModelData.swift
//  WatchWhat
//
//  Created by Drew Miller on 3/9/23.
//

import Foundation

class ModelData: ObservableObject {
    @Published var navigation = Navigation()

    @Published var movieId: Int? = nil
    @Published var searchValue: String = ""
    @Published var providerRegion: String? = "US"
}
