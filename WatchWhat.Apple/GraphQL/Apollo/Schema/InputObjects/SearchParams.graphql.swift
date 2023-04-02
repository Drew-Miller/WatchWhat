// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public extension WatchWhatSchema {
  struct SearchParams: InputObject {
    public private(set) var __data: InputDict

    public init(_ data: InputDict) {
      __data = data
    }

    public init(
      language: GraphQLNullable<String> = nil,
      query: String,
      page: GraphQLNullable<Int> = nil,
      includeAdult: GraphQLNullable<Bool> = nil,
      region: GraphQLNullable<String> = nil
    ) {
      __data = InputDict([
        "language": language,
        "query": query,
        "page": page,
        "includeAdult": includeAdult,
        "region": region
      ])
    }

    public var language: GraphQLNullable<String> {
      get { __data["language"] }
      set { __data["language"] = newValue }
    }

    public var query: String {
      get { __data["query"] }
      set { __data["query"] = newValue }
    }

    public var page: GraphQLNullable<Int> {
      get { __data["page"] }
      set { __data["page"] = newValue }
    }

    public var includeAdult: GraphQLNullable<Bool> {
      get { __data["includeAdult"] }
      set { __data["includeAdult"] = newValue }
    }

    public var region: GraphQLNullable<String> {
      get { __data["region"] }
      set { __data["region"] = newValue }
    }
  }

}