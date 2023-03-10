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
      case "MovieDetails": return WatchWhatSchema.Objects.MovieDetails
      case "Genre": return WatchWhatSchema.Objects.Genre
      case "ProductionCompany": return WatchWhatSchema.Objects.ProductionCompany
      case "ProductionCountry": return WatchWhatSchema.Objects.ProductionCountry
      case "SpokenLanguages": return WatchWhatSchema.Objects.SpokenLanguages
      case "Credits": return WatchWhatSchema.Objects.Credits
      case "Cast": return WatchWhatSchema.Objects.Cast
      case "Crew": return WatchWhatSchema.Objects.Crew
      case "TrailerResults": return WatchWhatSchema.Objects.TrailerResults
      case "Trailer": return WatchWhatSchema.Objects.Trailer
      case "PaginatedRecommendations": return WatchWhatSchema.Objects.PaginatedRecommendations
      case "Recommendation": return WatchWhatSchema.Objects.Recommendation
      case "Home": return WatchWhatSchema.Objects.Home
      case "GroupedMovies": return WatchWhatSchema.Objects.GroupedMovies
      case "Movie": return WatchWhatSchema.Objects.Movie
      default: return nil
      }
    }
  }

  enum Objects {}
  enum Interfaces {}
  enum Unions {}

}