// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public extension WatchWhatSchema {
  class HomeQuery: GraphQLQuery {
    public static let operationName: String = "Home"
    public static let document: ApolloAPI.DocumentType = .notPersisted(
      definition: .init(
        #"""
        query Home {
          home {
            __typename
            results {
              __typename
              id
              title
              movies {
                __typename
                id
                title
                poster_path
                backdrop_path
              }
            }
          }
        }
        """#
      ))

    public init() {}

    public struct Data: WatchWhatSchema.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ApolloAPI.ParentType { WatchWhatSchema.Objects.Query }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("home", Home.self),
      ] }

      public var home: Home { __data["home"] }

      /// Home
      ///
      /// Parent Type: `Home`
      public struct Home: WatchWhatSchema.SelectionSet {
        public let __data: DataDict
        public init(data: DataDict) { __data = data }

        public static var __parentType: ApolloAPI.ParentType { WatchWhatSchema.Objects.Home }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("results", [Result].self),
        ] }

        public var results: [Result] { __data["results"] }

        /// Home.Result
        ///
        /// Parent Type: `GroupedMovies`
        public struct Result: WatchWhatSchema.SelectionSet {
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
        }
      }
    }
  }

}