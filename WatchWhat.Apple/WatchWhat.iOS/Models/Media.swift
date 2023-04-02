//
//  Media.swift
//  WatchWhat.iOS
//
//  Created by Drew Miller on 4/1/23.
//

import Foundation

public struct MediaPage: Codable {
    public let page: Int
    public let total_pages: Int
    public let total_results: Int
    public let results: [Media]
    
    public init(data: DataDict, results: [DataDict]) {
        self.page = data["page"]
        self.total_pages = data["total_pages"]
        self.total_results = data["total_results"]
        self.results = results.map {
            return Media(data: $0)
        }
    }
}

public struct Media: Hashable, Codable {
    public let adult: Bool
    public let backdrop_path: String?
    public let genre_ids: [Int]
    public let id: Int
    public let name: String
    public let overview: String
    public let poster_path: String?
    public let release_date: String?
    public let media_type: String
        
    public init(data: DataDict) {
        self.adult = data["adult"]
        self.backdrop_path = data["backdrop_path"]
        self.genre_ids = data["genre_ids"]
        self.id = data["id"]
        self.name = data["name"]
        self.overview = data["overview"]
        self.poster_path = data["poster_path"]
        self.release_date = data["release_date"]
        self.media_type = data["media_type"]
    }
}
