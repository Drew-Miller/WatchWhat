// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public extension WatchWhatSchema {
  class VideosQuery: GraphQLQuery {
    public static let operationName: String = "Videos"
    public static let document: ApolloAPI.DocumentType = .notPersisted(
      definition: .init(
        #"""
        query Videos($media: String!, $id: Int!) {
          videos(media: $media, id: $id) {
            __typename
            id
            results {
              __typename
              id
              iso_639_1
              iso_3166_1
              key
              name
              official
              published_at
              site
              size
              type
            }
          }
        }
        """#
      ))

    public var media: String
    public var id: Int

    public init(
      media: String,
      id: Int
    ) {
      self.media = media
      self.id = id
    }

    public var __variables: Variables? { [
      "media": media,
      "id": id
    ] }

    public struct Data: WatchWhatSchema.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ApolloAPI.ParentType { WatchWhatSchema.Objects.Query }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("videos", Videos.self, arguments: [
          "media": .variable("media"),
          "id": .variable("id")
        ]),
      ] }

      public var videos: Videos { __data["videos"] }

      /// Videos
      ///
      /// Parent Type: `PageVideo`
      public struct Videos: WatchWhatSchema.SelectionSet {
        public let __data: DataDict
        public init(data: DataDict) { __data = data }

        public static var __parentType: ApolloAPI.ParentType { WatchWhatSchema.Objects.PageVideo }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("id", Int.self),
          .field("results", [Result].self),
        ] }

        public var id: Int { __data["id"] }
        public var results: [Result] { __data["results"] }

        /// Videos.Result
        ///
        /// Parent Type: `Video`
        public struct Result: WatchWhatSchema.SelectionSet {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public static var __parentType: ApolloAPI.ParentType { WatchWhatSchema.Objects.Video }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("id", String.self),
            .field("iso_639_1", String.self),
            .field("iso_3166_1", String.self),
            .field("key", String.self),
            .field("name", String?.self),
            .field("official", Bool.self),
            .field("published_at", String.self),
            .field("site", String.self),
            .field("size", Int.self),
            .field("type", String.self),
          ] }

          public var id: String { __data["id"] }
          public var iso_639_1: String { __data["iso_639_1"] }
          public var iso_3166_1: String { __data["iso_3166_1"] }
          public var key: String { __data["key"] }
          public var name: String? { __data["name"] }
          public var official: Bool { __data["official"] }
          public var published_at: String { __data["published_at"] }
          public var site: String { __data["site"] }
          public var size: Int { __data["size"] }
          public var type: String { __data["type"] }
        }
      }
    }
  }

}