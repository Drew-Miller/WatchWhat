//
//  Movie.swift
//  WatchWhat
//
//  Created by Drew Miller on 3/10/23.
//

import Foundation

/// Home.Result.Movie
///
/// Parent Type: `Movie`
public struct Movie: WatchWhatSchema.SelectionSet {
  public let __data: DataDict
  public init(data: DataDict) { __data = data }

  public static var __parentType: ApolloAPI.ParentType { WatchWhatSchema.Objects.Movie }
  public static var __selections: [ApolloAPI.Selection] { [
    .field("id", Int.self),
    .field("title", String.self),
    .field("poster_path", String?.self),
    .field("backdrop_path", String?.self),
  ] }

  public var id: Int { __data["id"] }
  public var title: String { __data["title"] }
  public var poster_path: String? { __data["poster_path"] }
  public var backdrop_path: String? { __data["backdrop_path"] }
}
