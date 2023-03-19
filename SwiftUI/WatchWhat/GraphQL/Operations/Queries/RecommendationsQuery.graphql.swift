// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public extension WatchWhatSchema {
  class RecommendationsQuery: GraphQLQuery {
    public static let operationName: String = "Recommendations"
    public static let document: ApolloAPI.DocumentType = .notPersisted(
      definition: .init(
        #"""
        query Recommendations($id: Int!) {
          recommendations(id: $id) {
            __typename
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
        .field("recommendations", Recommendations.self, arguments: ["id": .variable("id")]),
      ] }

      public var recommendations: Recommendations { __data["recommendations"] }

      /// Recommendations
      ///
      /// Parent Type: `PaginatedRecommendation`
      public struct Recommendations: WatchWhatSchema.SelectionSet {
        public let __data: DataDict
        public init(data: DataDict) { __data = data }

        public static var __parentType: ApolloAPI.ParentType { WatchWhatSchema.Objects.PaginatedRecommendation }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("results", [Result].self),
        ] }

        public var results: [Result] { __data["results"] }

        /// Recommendations.Result
        ///
        /// Parent Type: `Recommendation`
        public struct Result: WatchWhatSchema.SelectionSet {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public static var __parentType: ApolloAPI.ParentType { WatchWhatSchema.Objects.Recommendation }
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