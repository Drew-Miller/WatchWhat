// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public extension WatchWhatSchema {
  class VideosQuery: GraphQLQuery {
    public static let operationName: String = "Videos"
    public static let document: ApolloAPI.DocumentType = .notPersisted(
      definition: .init(
        #"""
        query Videos($id: Int!) {
          videos(id: $id) {
            __typename
            results {
              __typename
              key
              name
              official
            }
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
        .field("videos", Videos.self, arguments: ["id": .variable("id")]),
      ] }

      public var videos: Videos { __data["videos"] }

      /// Videos
      ///
      /// Parent Type: `TrailerResults`
      public struct Videos: WatchWhatSchema.SelectionSet {
        public let __data: DataDict
        public init(data: DataDict) { __data = data }

        public static var __parentType: ApolloAPI.ParentType { WatchWhatSchema.Objects.TrailerResults }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("results", [Result].self),
        ] }

        public var results: [Result] { __data["results"] }

        /// Videos.Result
        ///
        /// Parent Type: `Trailer`
        public struct Result: WatchWhatSchema.SelectionSet {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public static var __parentType: ApolloAPI.ParentType { WatchWhatSchema.Objects.Trailer }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("key", String.self),
            .field("name", String?.self),
            .field("official", Bool.self),
          ] }

          public var key: String { __data["key"] }
          public var name: String? { __data["name"] }
          public var official: Bool { __data["official"] }
        }
      }
    }
  }

}