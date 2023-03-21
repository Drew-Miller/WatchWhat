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
    .field("movies", [Movie].self),
  ] }

  public var id: Int { __data["id"] }
  public var title: String { __data["title"] }
  public var movies: [Movie] { __data["movies"] }
}
