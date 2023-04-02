//
//  Video.swift
//  WatchWhat
//
//  Created by Drew Miller on 3/18/23.
//

import Foundation

public struct Video: WatchWhatSchema.SelectionSet {
  public let __data: DataDict
  public init(data: DataDict) { __data = data }

  public static var __parentType: ApolloAPI.ParentType { WatchWhatSchema.Objects.Video }
  public static var __selections: [ApolloAPI.Selection] { [
    .field("id", String.self),
    .field("iso_639_1", String.self),
    .field("iso_3166_1", String.self),
    .field("key", String.self),
    .field("name", String?.self),
    .field("official", Bool.self),
    .field("published_at", String.self),
    .field("site", String.self),
    .field("size", Int.self),
    .field("type", String.self),
  ] }

  public var id: String { __data["id"] }
  public var iso_639_1: String { __data["iso_639_1"] }
  public var iso_3166_1: String { __data["iso_3166_1"] }
  public var key: String { __data["key"] }
  public var name: String? { __data["name"] }
  public var official: Bool { __data["official"] }
  public var published_at: String { __data["published_at"] }
  public var site: String { __data["site"] }
  public var size: Int { __data["size"] }
  public var type: String { __data["type"] }
}
