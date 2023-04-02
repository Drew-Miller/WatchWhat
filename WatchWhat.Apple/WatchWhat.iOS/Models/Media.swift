//
//  Media.swift
//  WatchWhat.iOS
//
//  Created by Drew Miller on 4/1/23.
//

import Foundation

public struct Media: Hashable, Codable {
    public var adult: Bool
    public var backdrop_path: String?
    public var genre_ids: [Int]
    public var id: Int
    public var name: String
    public var overview: String
    public var poster_path: String?
    public var release_date: String?
    public var media_type: String
        
    public init(data: DataDict) {
        self.adult = data["adult"]
        self.backdrop_path = data["backdrop_path"]
        self.genre_ids = data["genre_ids"]
        self.id = data["id"]
        self.name = data["name"]
        self.overview = data["overview"]
        self.poster_path = data["poster_path"]
        self.release_date = data["release_date"]
        self.genre_ids = data["genre_ids"]
        self.media_type = data["media_type"]
    }
}
