// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public protocol WatchWhatSchema_SelectionSet: ApolloAPI.SelectionSet & ApolloAPI.RootSelectionSet
where Schema == WatchWhatSchema.SchemaMetadata {}

public protocol WatchWhatSchema_InlineFragment: ApolloAPI.SelectionSet & ApolloAPI.InlineFragment
where Schema == WatchWhatSchema.SchemaMetadata {}

public protocol WatchWhatSchema_MutableSelectionSet: ApolloAPI.MutableRootSelectionSet
where Schema == WatchWhatSchema.SchemaMetadata {}

public protocol WatchWhatSchema_MutableInlineFragment: ApolloAPI.MutableSelectionSet & ApolloAPI.InlineFragment
where Schema == WatchWhatSchema.SchemaMetadata {}

public extension WatchWhatSchema {
  typealias ID = String

  typealias SelectionSet = WatchWhatSchema_SelectionSet

  typealias InlineFragment = WatchWhatSchema_InlineFragment

  typealias MutableSelectionSet = WatchWhatSchema_MutableSelectionSet

  typealias MutableInlineFragment = WatchWhatSchema_MutableInlineFragment

  enum SchemaMetadata: ApolloAPI.SchemaMetadata {
    public static let configuration: ApolloAPI.SchemaConfiguration.Type = SchemaConfiguration.self

    public static func objectType(forTypename typename: String) -> Object? {
      switch typename {
      case "Query": return WatchWhatSchema.Objects.Query
      case "Movie": return WatchWhatSchema.Objects.Movie
      case "Genre": return WatchWhatSchema.Objects.Genre
      case "Company": return WatchWhatSchema.Objects.Company
      case "Country": return WatchWhatSchema.Objects.Country
      case "SpokenLanguages": return WatchWhatSchema.Objects.SpokenLanguages
      case "PageVideo": return WatchWhatSchema.Objects.PageVideo
      case "Video": return WatchWhatSchema.Objects.Video
      case "PageMedia": return WatchWhatSchema.Objects.PageMedia
      case "MediaResult": return WatchWhatSchema.Objects.MediaResult
      case "ProviderTypes": return WatchWhatSchema.Objects.ProviderTypes
      case "Provider": return WatchWhatSchema.Objects.Provider
      case "TV": return WatchWhatSchema.Objects.TV
      case "CreatedBy": return WatchWhatSchema.Objects.CreatedBy
      case "Episode": return WatchWhatSchema.Objects.Episode
      case "Season": return WatchWhatSchema.Objects.Season
      default: return nil
      }
    }
  }

  enum Objects {}
  enum Interfaces {}
  enum Unions {}

}