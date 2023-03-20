// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public extension WatchWhatSchema {
  class WebURLQuery: GraphQLQuery {
    public static let operationName: String = "WebURL"
    public static let document: ApolloAPI.DocumentType = .notPersisted(
      definition: .init(
        #"""
        query WebURL($tmdbId: Int!, $titleType: String!, $sourceName: String!) {
          webUrl(tmdbId: $tmdbId, titleType: $titleType, sourceName: $sourceName)
        }
        """#
      ))

    public var tmdbId: Int
    public var titleType: String
    public var sourceName: String

    public init(
      tmdbId: Int,
      titleType: String,
      sourceName: String
    ) {
      self.tmdbId = tmdbId
      self.titleType = titleType
      self.sourceName = sourceName
    }

    public var __variables: Variables? { [
      "tmdbId": tmdbId,
      "titleType": titleType,
      "sourceName": sourceName
    ] }

    public struct Data: WatchWhatSchema.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ApolloAPI.ParentType { WatchWhatSchema.Objects.Query }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("webUrl", String.self, arguments: [
          "tmdbId": .variable("tmdbId"),
          "titleType": .variable("titleType"),
          "sourceName": .variable("sourceName")
        ]),
      ] }

      public var webUrl: String { __data["webUrl"] }
    }
  }

}