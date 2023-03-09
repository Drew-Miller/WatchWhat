// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public extension WatchWhatSchema {
  class GenresQuery: GraphQLQuery {
    public static let operationName: String = "Genres"
    public static let document: ApolloAPI.DocumentType = .notPersisted(
      definition: .init(
        #"""
        query Genres {
          genres {
            __typename
            id
            name
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
        .field("genres", [Genre].self),
      ] }

      public var genres: [Genre] { __data["genres"] }

      /// Genre
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
    }
  }

}