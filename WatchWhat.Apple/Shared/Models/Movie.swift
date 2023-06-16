//
//  MovieDetail.swift
//  WatchWhat
//
//  Created by Drew Miller on 3/11/23.
//

import Foundation

struct Movie: Codable, Hashable {
    let id: Int
    let imdbId: String
    
    let title: String
    let overview: String
    let poster: String?
    
    let genres: [Genre]
    let mpaaRating: String
    
    let release: String
    let runtime: Int
    
    let voteAverage: Double
    let voteCount: Int
}
