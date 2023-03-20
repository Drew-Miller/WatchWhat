// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public extension WatchWhatSchema {
  class MovieQuery: GraphQLQuery {
    public static let operationName: String = "Movie"
    public static let document: ApolloAPI.DocumentType = .notPersisted(
      definition: .init(
        #"""
        query Movie($id: Int!) {
          movie(id: $id) {
            __typename
            backdrop_path
            genres {
              __typename
              id
              name
            }
            id
            imdb_id
            mpaa_rating
            overview
            popularity
            poster_path
            production_companies {
              __typename
              id
              logo_path
              name
            }
            release_date
            revenue
            runtime
            spoken_languages {
              __typename
              english_name
              iso_639_1
              name
            }
            title
            vote_average
            vote_count
          }
        }
        """#
      ))

    public var id: Int

    public init(id: Int) {
      self.id = id
    }

    public var __variables: Variables? { ["id": id] }

    public struct Data: WatchWhatSchema.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ApolloAPI.ParentType { WatchWhatSchema.Objects.Query }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("movie", Movie.self, arguments: ["id": .variable("id")]),
      ] }

      public var movie: Movie { __data["movie"] }

      /// Movie
      ///
      /// Parent Type: `MovieDetails`
      public struct Movie: WatchWhatSchema.SelectionSet {
        public let __data: DataDict
        public init(data: DataDict) { __data = data }

        public static var __parentType: ApolloAPI.ParentType { WatchWhatSchema.Objects.MovieDetails }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("backdrop_path", String?.self),
          .field("genres", [Genre].self),
          .field("id", Int.self),
          .field("imdb_id", String.self),
          .field("mpaa_rating", String.self),
          .field("overview", String.self),
          .field("popularity", Double.self),
          .field("poster_path", String?.self),
          .field("production_companies", [Production_company].self),
          .field("release_date", String.self),
          .field("revenue", Int.self),
          .field("runtime", Int.self),
          .field("spoken_languages", [Spoken_language].self),
          .field("title", String.self),
          .field("vote_average", Double.self),
          .field("vote_count", Int.self),
        ] }

        public var backdrop_path: String? { __data["backdrop_path"] }
        public var genres: [Genre] { __data["genres"] }
        public var id: Int { __data["id"] }
        public var imdb_id: String { __data["imdb_id"] }
        public var mpaa_rating: String { __data["mpaa_rating"] }
        public var overview: String { __data["overview"] }
        public var popularity: Double { __data["popularity"] }
        public var poster_path: String? { __data["poster_path"] }
        public var production_companies: [Production_company] { __data["production_companies"] }
        public var release_date: String { __data["release_date"] }
        public var revenue: Int { __data["revenue"] }
        public var runtime: Int { __data["runtime"] }
        public var spoken_languages: [Spoken_language] { __data["spoken_languages"] }
        public var title: String { __data["title"] }
        public var vote_average: Double { __data["vote_average"] }
        public var vote_count: Int { __data["vote_count"] }

        /// Movie.Genre
        ///
        /// Parent Type: `Genre`
        public struct Genre: WatchWhatSchema.SelectionSet {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public static var __parentType: ApolloAPI.ParentType { WatchWhatSchema.Objects.Genre }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("id", Int.self),
            .field("name", String.self),
          ] }

          public var id: Int { __data["id"] }
          public var name: String { __data["name"] }
        }

        /// Movie.Production_company
        ///
        /// Parent Type: `ProductionCompany`
        public struct Production_company: WatchWhatSchema.SelectionSet {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public static var __parentType: ApolloAPI.ParentType { WatchWhatSchema.Objects.ProductionCompany }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("id", Int.self),
            .field("logo_path", String?.self),
            .field("name", String.self),
          ] }

          public var id: Int { __data["id"] }
          public var logo_path: String? { __data["logo_path"] }
          public var name: String { __data["name"] }
        }

        /// Movie.Spoken_language
        ///
        /// Parent Type: `SpokenLanguages`
        public struct Spoken_language: WatchWhatSchema.SelectionSet {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public static var __parentType: ApolloAPI.ParentType { WatchWhatSchema.Objects.SpokenLanguages }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("english_name", String.self),
            .field("iso_639_1", String.self),
            .field("name", String.self),
          ] }

          public var english_name: String { __data["english_name"] }
          public var iso_639_1: String { __data["iso_639_1"] }
          public var name: String { __data["name"] }
        }
      }
    }
  }

}