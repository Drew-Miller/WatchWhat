// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public extension WatchWhatSchema {
  class PopularMoviesQuery: GraphQLQuery {
    public static let operationName: String = "PopularMovies"
    public static let document: ApolloAPI.DocumentType = .notPersisted(
      definition: .init(
        #"""
        query PopularMovies($page: Int) {
          popularMovies(page: $page) {
            __typename
            page
            total_pages
            total_results
            results {
              __typename
              adult
              backdrop_path
              genre_ids
              id
              original_language
              original_title
              overview
              popularity
              poster_path
              release_date
              title
              video
              vote_average
              vote_count
            }
          }
        }
        """#
      ))

    public var page: GraphQLNullable<Int>

    public init(page: GraphQLNullable<Int>) {
      self.page = page
    }

    public var __variables: Variables? { ["page": page] }

    public struct Data: WatchWhatSchema.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ApolloAPI.ParentType { WatchWhatSchema.Objects.Query }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("popularMovies", PopularMovies.self, arguments: ["page": .variable("page")]),
      ] }

      public var popularMovies: PopularMovies { __data["popularMovies"] }

      /// PopularMovies
      ///
      /// Parent Type: `PaginatedMovies`
      public struct PopularMovies: WatchWhatSchema.SelectionSet {
        public let __data: DataDict
        public init(data: DataDict) { __data = data }

        public static var __parentType: ApolloAPI.ParentType { WatchWhatSchema.Objects.PaginatedMovies }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("page", Int.self),
          .field("total_pages", Int.self),
          .field("total_results", Int.self),
          .field("results", [Result?]?.self),
        ] }

        public var page: Int { __data["page"] }
        public var total_pages: Int { __data["total_pages"] }
        public var total_results: Int { __data["total_results"] }
        public var results: [Result?]? { __data["results"] }

        /// PopularMovies.Result
        ///
        /// Parent Type: `Movie`
        public struct Result: WatchWhatSchema.SelectionSet {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public static var __parentType: ApolloAPI.ParentType { WatchWhatSchema.Objects.Movie }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("adult", Bool.self),
            .field("backdrop_path", String?.self),
            .field("genre_ids", [Int?]?.self),
            .field("id", Int.self),
            .field("original_language", String.self),
            .field("original_title", String.self),
            .field("overview", String.self),
            .field("popularity", Double.self),
            .field("poster_path", String?.self),
            .field("release_date", String.self),
            .field("title", String.self),
            .field("video", Bool.self),
            .field("vote_average", Double.self),
            .field("vote_count", Int.self),
          ] }

          public var adult: Bool { __data["adult"] }
          public var backdrop_path: String? { __data["backdrop_path"] }
          public var genre_ids: [Int?]? { __data["genre_ids"] }
          public var id: Int { __data["id"] }
          public var original_language: String { __data["original_language"] }
          public var original_title: String { __data["original_title"] }
          public var overview: String { __data["overview"] }
          public var popularity: Double { __data["popularity"] }
          public var poster_path: String? { __data["poster_path"] }
          public var release_date: String { __data["release_date"] }
          public var title: String { __data["title"] }
          public var video: Bool { __data["video"] }
          public var vote_average: Double { __data["vote_average"] }
          public var vote_count: Int { __data["vote_count"] }
        }
      }
    }
  }

}