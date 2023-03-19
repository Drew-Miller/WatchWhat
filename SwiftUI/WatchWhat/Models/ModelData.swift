//
//  ModelData.swift
//  WatchWhat
//
//  Created by Drew Miller on 3/9/23.
//

import Foundation

class ModelData: ObservableObject {
    @Published var navigation = Navigation()
    @Published var searchValue: String = ""
    @Published var providerRegion: String? = "US"
    
    @Published private(set) var movieId: Int?
    @Published private var _movieIds: [Int] = [Int]()
    
    func selectMovieId(_ id: Int) {
        movieId = id
        _movieIds.append(id)
    }
    
    func removeMovieId() {
        guard !(_movieIds.count > 1) else {
            _movieIds.removeLast()
            movieId = _movieIds[0]
            return
        }
        
        if !_movieIds.isEmpty {
            _movieIds.removeLast()
        }
        
        movieId = nil
    }
}
