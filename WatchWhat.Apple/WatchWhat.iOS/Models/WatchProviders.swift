//
//  WatchProvider.swift
//  WatchWhat
//
//  Created by Drew Miller on 3/11/23.
//

import Foundation

public struct WatchProviders: WatchWhatSchema.SelectionSet {
  public let __data: DataDict
  public init(data: DataDict) { __data = data }

  public static var __parentType: ApolloAPI.ParentType { WatchWhatSchema.Objects.WatchProviders }
  public static var __selections: [ApolloAPI.Selection] { [
    .field("link", String.self),
    .field("buy", [Buy]?.self),
    .field("rent", [Rent]?.self),
    .field("flatrate", [Flatrate]?.self),
  ] }

  public var link: String { __data["link"] }
  public var buy: [Buy]? { __data["buy"] }
  public var rent: [Rent]? { __data["rent"] }
  public var flatrate: [Flatrate]? { __data["flatrate"] }

  /// WatchMovie.Buy
  ///
  /// Parent Type: `Provider`
  public struct Buy: WatchWhatSchema.SelectionSet {
    public let __data: DataDict
    public init(data: DataDict) { __data = data }

    public static var __parentType: ApolloAPI.ParentType { WatchWhatSchema.Objects.Provider }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("display_priority", Int.self),
      .field("logo_path", String?.self),
      .field("provider_name", String.self),
      .field("provider_id", Int.self),
    ] }

    public var display_priority: Int { __data["display_priority"] }
    public var logo_path: String? { __data["logo_path"] }
    public var provider_name: String { __data["provider_name"] }
    public var provider_id: Int { __data["provider_id"] }
  }

  /// WatchMovie.Rent
  ///
  /// Parent Type: `Provider`
  public struct Rent: WatchWhatSchema.SelectionSet {
    public let __data: DataDict
    public init(data: DataDict) { __data = data }

    public static var __parentType: ApolloAPI.ParentType { WatchWhatSchema.Objects.Provider }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("display_priority", Int.self),
      .field("logo_path", String?.self),
      .field("provider_name", String.self),
      .field("provider_id", Int.self),
    ] }

    public var display_priority: Int { __data["display_priority"] }
    public var logo_path: String? { __data["logo_path"] }
    public var provider_name: String { __data["provider_name"] }
    public var provider_id: Int { __data["provider_id"] }
  }

  /// WatchMovie.Flatrate
  ///
  /// Parent Type: `Provider`
  public struct Flatrate: WatchWhatSchema.SelectionSet {
    public let __data: DataDict
    public init(data: DataDict) { __data = data }

    public static var __parentType: ApolloAPI.ParentType { WatchWhatSchema.Objects.Provider }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("display_priority", Int.self),
      .field("logo_path", String?.self),
      .field("provider_name", String.self),
      .field("provider_id", Int.self),
    ] }

    public var display_priority: Int { __data["display_priority"] }
    public var logo_path: String? { __data["logo_path"] }
    public var provider_name: String { __data["provider_name"] }
    public var provider_id: Int { __data["provider_id"] }
  }
}
