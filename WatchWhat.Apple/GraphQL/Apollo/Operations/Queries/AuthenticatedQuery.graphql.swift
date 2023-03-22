// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public extension WatchWhatSchema {
  class AuthenticatedQuery: GraphQLQuery {
    public static let operationName: String = "Authenticated"
    public static let document: ApolloAPI.DocumentType = .notPersisted(
      definition: .init(
        #"""
        query Authenticated {
          authenticated
        }
        """#
      ))

    public init() {}

    public struct Data: WatchWhatSchema.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ApolloAPI.ParentType { WatchWhatSchema.Objects.Query }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("authenticated", String.self),
      ] }

      public var authenticated: String { __data["authenticated"] }
    }
  }

}