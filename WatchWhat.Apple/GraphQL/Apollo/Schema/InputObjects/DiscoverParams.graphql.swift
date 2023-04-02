// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public extension WatchWhatSchema {
  struct DiscoverParams: InputObject {
    public private(set) var __data: InputDict

    public init(_ data: InputDict) {
      __data = data
    }

    public init(
      page: GraphQLNullable<Int> = nil,
      genreIds: GraphQLNullable<[Int]> = nil
    ) {
      __data = InputDict([
        "page": page,
        "genreIds": genreIds
      ])
    }

    public var page: GraphQLNullable<Int> {
      get { __data["page"] }
      set { __data["page"] = newValue }
    }

    public var genreIds: GraphQLNullable<[Int]> {
      get { __data["genreIds"] }
      set { __data["genreIds"] = newValue }
    }
  }

}