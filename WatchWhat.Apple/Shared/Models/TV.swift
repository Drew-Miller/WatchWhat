//
//  TV.swift
//  WatchWhat.iOS
//
//  Created by Drew Miller on 4/2/23.
//

import Foundation


public struct Season: Codable {
    public var id: Int
    public var seasonNumber: Int
    public var episodeCount: Int
    
    public var name: String
    public var overview: String
}

public struct Episode: Codable {
    public var id: Int
    public var showId: Int
    public var seasonNumber: Int
    public var episodeNumber: Int
    
    public var name: String
    public var overview: String
    public var stillPath: String
    
    public var airdate: String
    public var runtime: Int
    
    public var voteAverage: Double
    public var voteCount: Int
}

public struct TV: Codable {
    public var id: Int
    public var imdbId: Int
    
    public var name: String
    public var overview: String
    public var posterPath: String?
    
    public var genres: [Genre]
    public var contentRating: String
    
    public var firstAirDate: String
    public var lastAirDate: String
    public var numberOfSeasons: Int?
    
    public var voteAverage: Double
    public var voteCount: Int
}
