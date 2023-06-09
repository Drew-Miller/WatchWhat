// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public extension WatchWhatSchema {
  class MovieQuery: GraphQLQuery {
    public static let operationName: String = "Movie"
    public static let document: ApolloAPI.DocumentType = .notPersisted(
      definition: .init(
        #"""
        query Movie($movieId: Int!) {
          movie(id: $movieId) {
            __typename
            adult
            backdrop_path
            budget
            genres {
              __typename
              id
              name
            }
            homepage
            id
            imdb_id
            mpaa_rating
            original_language
            original_title
            overview
            popularity
            poster_path
            production_companies {
              __typename
              id
              logo_path
              name
              origin_country
            }
            production_countries {
              __typename
              iso_3166_1
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
            status
            tagline
            title
            video
            vote_average
            vote_count
          }
        }
        """#
      ))

    public var movieId: Int

    public init(movieId: Int) {
      self.movieId = movieId
    }

    public var __variables: Variables? { ["movieId": movieId] }

    public struct Data: WatchWhatSchema.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ApolloAPI.ParentType { WatchWhatSchema.Objects.Query }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("movie", Movie.self, arguments: ["id": .variable("movieId")]),
      ] }

      public var movie: Movie { __data["movie"] }

      /// Movie
      ///
      /// Parent Type: `Movie`
      public struct Movie: WatchWhatSchema.SelectionSet {
        public let __data: DataDict
        public init(data: DataDict) { __data = data }

        public static var __parentType: ApolloAPI.ParentType { WatchWhatSchema.Objects.Movie }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("adult", Bool.self),
          .field("backdrop_path", String?.self),
          .field("budget", Int.self),
          .field("genres", [Genre].self),
          .field("homepage", String.self),
          .field("id", Int.self),
          .field("imdb_id", String.self),
          .field("mpaa_rating", String.self),
          .field("original_language", String.self),
          .field("original_title", String.self),
          .field("overview", String.self),
          .field("popularity", Double.self),
          .field("poster_path", String?.self),
          .field("production_companies", [Production_company].self),
          .field("production_countries", [Production_country].self),
          .field("release_date", String.self),
          .field("revenue", Int.self),
          .field("runtime", Int.self),
          .field("spoken_languages", [Spoken_language].self),
          .field("status", String.self),
          .field("tagline", String.self),
          .field("title", String.self),
          .field("video", Bool.self),
          .field("vote_average", Double.self),
          .field("vote_count", Int.self),
        ] }

        public var adult: Bool { __data["adult"] }
        public var backdrop_path: String? { __data["backdrop_path"] }
        public var budget: Int { __data["budget"] }
        public var genres: [Genre] { __data["genres"] }
        public var homepage: String { __data["homepage"] }
        public var id: Int { __data["id"] }
        public var imdb_id: String { __data["imdb_id"] }
        public var mpaa_rating: String { __data["mpaa_rating"] }
        public var original_language: String { __data["original_language"] }
        public var original_title: String { __data["original_title"] }
        public var overview: String { __data["overview"] }
        public var popularity: Double { __data["popularity"] }
        public var poster_path: String? { __data["poster_path"] }
        public var production_companies: [Production_company] { __data["production_companies"] }
        public var production_countries: [Production_country] { __data["production_countries"] }
        public var release_date: String { __data["release_date"] }
        public var revenue: Int { __data["revenue"] }
        public var runtime: Int { __data["runtime"] }
        public var spoken_languages: [Spoken_language] { __data["spoken_languages"] }
        public var status: String { __data["status"] }
        public var tagline: String { __data["tagline"] }
        public var title: String { __data["title"] }
        public var video: Bool { __data["video"] }
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
        /// Parent Type: `Company`
        public struct Production_company: WatchWhatSchema.SelectionSet {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public static var __parentType: ApolloAPI.ParentType { WatchWhatSchema.Objects.Company }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("id", Int.self),
            .field("logo_path", String?.self),
            .field("name", String.self),
            .field("origin_country", String.self),
          ] }

          public var id: Int { __data["id"] }
          public var logo_path: String? { __data["logo_path"] }
          public var name: String { __data["name"] }
          public var origin_country: String { __data["origin_country"] }
        }

        /// Movie.Production_country
        ///
        /// Parent Type: `Country`
        public struct Production_country: WatchWhatSchema.SelectionSet {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public static var __parentType: ApolloAPI.ParentType { WatchWhatSchema.Objects.Country }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("iso_3166_1", String.self),
            .field("name", String.self),
          ] }

          public var iso_3166_1: String { __data["iso_3166_1"] }
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