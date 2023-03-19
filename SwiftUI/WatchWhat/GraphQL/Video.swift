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

  public static var __parentType: ApolloAPI.ParentType { WatchWhatSchema.Objects.Trailer }
  public static var __selections: [ApolloAPI.Selection] { [
    .field("key", String.self),
    .field("name", String?.self),
    .field("official", Bool.self),
  ] }

  public var key: String { __data["key"] }
  public var name: String? { __data["name"] }
  public var official: Bool { __data["official"] }
}
