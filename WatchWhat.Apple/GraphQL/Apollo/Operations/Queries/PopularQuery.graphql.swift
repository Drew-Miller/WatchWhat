// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public extension WatchWhatSchema {
  class PopularQuery: GraphQLQuery {
    public static let operationName: String = "Popular"
    public static let document: ApolloAPI.DocumentType = .notPersisted(
      definition: .init(
        #"""
        query Popular($media: String!, $params: PopularParams) {
          popular(media: $media, params: $params) {
            __typename
            page
            total_pages
            results {
              __typename
              adult
              backdrop_path
              genre_ids
              id
              name
              overview
              poster_path
              release_date
              media_type
            }
          }
        }
        """#
      ))

    public var media: String
    public var params: GraphQLNullable<PopularParams>

    public init(
      media: String,
      params: GraphQLNullable<PopularParams>
    ) {
      self.media = media
      self.params = params
    }

    public var __variables: Variables? { [
      "media": media,
      "params": params
    ] }

    public struct Data: WatchWhatSchema.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ApolloAPI.ParentType { WatchWhatSchema.Objects.Query }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("popular", Popular.self, arguments: [
          "media": .variable("media"),
          "params": .variable("params")
        ]),
      ] }

      public var popular: Popular { __data["popular"] }

      /// Popular
      ///
      /// Parent Type: `PageMedia`
      public struct Popular: WatchWhatSchema.SelectionSet {
        public let __data: DataDict
        public init(data: DataDict) { __data = data }

        public static var __parentType: ApolloAPI.ParentType { WatchWhatSchema.Objects.PageMedia }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("page", Int.self),
          .field("total_pages", Int.self),
          .field("results", [Result].self),
        ] }

        public var page: Int { __data["page"] }
        public var total_pages: Int { __data["total_pages"] }
        public var results: [Result] { __data["results"] }

        /// Popular.Result
        ///
        /// Parent Type: `MediaResult`
        public struct Result: WatchWhatSchema.SelectionSet {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public static var __parentType: ApolloAPI.ParentType { WatchWhatSchema.Objects.MediaResult }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("adult", Bool.self),
            .field("backdrop_path", String?.self),
            .field("genre_ids", [Int].self),
            .field("id", Int.self),
            .field("name", String.self),
            .field("overview", String.self),
            .field("poster_path", String?.self),
            .field("release_date", String?.self),
            .field("media_type", String.self),
          ] }

          public var adult: Bool { __data["adult"] }
          public var backdrop_path: String? { __data["backdrop_path"] }
          public var genre_ids: [Int] { __data["genre_ids"] }
          public var id: Int { __data["id"] }
          public var name: String { __data["name"] }
          public var overview: String { __data["overview"] }
          public var poster_path: String? { __data["poster_path"] }
          public var release_date: String? { __data["release_date"] }
          public var media_type: String { __data["media_type"] }
        }
      }
    }
  }

}