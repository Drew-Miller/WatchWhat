// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public extension WatchWhatSchema {
  class SearchQuery: GraphQLQuery {
    public static let operationName: String = "Search"
    public static let document: ApolloAPI.DocumentType = .notPersisted(
      definition: .init(
        #"""
        query Search($query: String!, $page: Int) {
          searchMovies(query: $query, page: $page) {
            __typename
            page
            total_pages
            total_results
            results {
              __typename
              id
              title
              poster_path
              backdrop_path
            }
          }
        }
        """#
      ))

    public var query: String
    public var page: GraphQLNullable<Int>

    public init(
      query: String,
      page: GraphQLNullable<Int>
    ) {
      self.query = query
      self.page = page
    }

    public var __variables: Variables? { [
      "query": query,
      "page": page
    ] }

    public struct Data: WatchWhatSchema.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ApolloAPI.ParentType { WatchWhatSchema.Objects.Query }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("searchMovies", SearchMovies.self, arguments: [
          "query": .variable("query"),
          "page": .variable("page")
        ]),
      ] }

      public var searchMovies: SearchMovies { __data["searchMovies"] }

      /// SearchMovies
      ///
      /// Parent Type: `PaginatedMovies`
      public struct SearchMovies: WatchWhatSchema.SelectionSet {
        public let __data: DataDict
        public init(data: DataDict) { __data = data }

        public static var __parentType: ApolloAPI.ParentType { WatchWhatSchema.Objects.PaginatedMovies }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("page", Int.self),
          .field("total_pages", Int.self),
          .field("total_results", Int.self),
          .field("results", [Result].self),
        ] }

        public var page: Int { __data["page"] }
        public var total_pages: Int { __data["total_pages"] }
        public var total_results: Int { __data["total_results"] }
        public var results: [Result] { __data["results"] }

        /// SearchMovies.Result
        ///
        /// Parent Type: `Movie`
        public struct Result: WatchWhatSchema.SelectionSet {
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