// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public extension WatchWhatSchema {
  struct PopularParams: InputObject {
    public private(set) var __data: InputDict

    public init(_ data: InputDict) {
      __data = data
    }

    public init(
      page: GraphQLNullable<Int> = nil,
      region: GraphQLNullable<String> = nil
    ) {
      __data = InputDict([
        "page": page,
        "region": region
      ])
    }

    public var page: GraphQLNullable<Int> {
      get { __data["page"] }
      set { __data["page"] = newValue }
    }

    public var region: GraphQLNullable<String> {
      get { __data["region"] }
      set { __data["region"] = newValue }
    }
  }

}