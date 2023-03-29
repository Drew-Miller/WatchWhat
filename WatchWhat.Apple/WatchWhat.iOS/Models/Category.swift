//
//  MovieCategory.swift
//  WatchWhat
//
//  Created by Drew Miller on 3/10/23.
//

import Foundation

public struct MovieCategory: WatchWhatSchema.SelectionSet {
    public let __data: DataDict
    public init(data: DataDict) { __data = data }
    
    public static var __parentType: ApolloAPI.ParentType { WatchWhatSchema.Objects.GroupedMovies }
    public static var __selections: [ApolloAPI.Selection] { [
        .field("id", Int.self),
        .field("title", String.self),
        .field("movies", [MovieItem].self),
    ] }
    
    public var id: Int { __data["id"] }
    public var title: String { __data["title"] }
    public var movies: [MovieItem] { __data["movies"] }
}

struct Category: Hashable, Codable {
    let id: Int
    let title: String
    let items: [Item]
    
    public static func fromMovieCategory(data: DataDict) -> Category {
        let mc = MovieCategory(data: data)
        return Category(id: mc.id, title: mc.title, items: mc.movies.map {
            return Item.fromMovie(data: $0.__data)
        })
    }
}
