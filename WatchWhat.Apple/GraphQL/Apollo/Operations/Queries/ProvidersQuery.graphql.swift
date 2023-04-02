// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public extension WatchWhatSchema {
  class ProvidersQuery: GraphQLQuery {
    public static let operationName: String = "Providers"
    public static let document: ApolloAPI.DocumentType = .notPersisted(
      definition: .init(
        #"""
        query Providers($media: String!, $id: Int!, $region: String!) {
          providers(media: $media, id: $id, region: $region) {
            __typename
            link
            buy {
              __typename
              display_priority
              logo_path
              provider_name
              provider_id
            }
            rent {
              __typename
              display_priority
              logo_path
              provider_name
              provider_id
            }
            flatrate {
              __typename
              display_priority
              logo_path
              provider_name
              provider_id
            }
          }
        }
        """#
      ))

    public var media: String
    public var id: Int
    public var region: String

    public init(
      media: String,
      id: Int,
      region: String
    ) {
      self.media = media
      self.id = id
      self.region = region
    }

    public var __variables: Variables? { [
      "media": media,
      "id": id,
      "region": region
    ] }

    public struct Data: WatchWhatSchema.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ApolloAPI.ParentType { WatchWhatSchema.Objects.Query }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("providers", Providers.self, arguments: [
          "media": .variable("media"),
          "id": .variable("id"),
          "region": .variable("region")
        ]),
      ] }

      public var providers: Providers { __data["providers"] }

      /// Providers
      ///
      /// Parent Type: `ProviderTypes`
      public struct Providers: WatchWhatSchema.SelectionSet {
        public let __data: DataDict
        public init(data: DataDict) { __data = data }

        public static var __parentType: ApolloAPI.ParentType { WatchWhatSchema.Objects.ProviderTypes }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("link", String.self),
          .field("buy", [Buy]?.self),
          .field("rent", [Rent]?.self),
          .field("flatrate", [Flatrate]?.self),
        ] }

        public var link: String { __data["link"] }
        public var buy: [Buy]? { __data["buy"] }
        public var rent: [Rent]? { __data["rent"] }
        public var flatrate: [Flatrate]? { __data["flatrate"] }

        /// Providers.Buy
        ///
        /// Parent Type: `Provider`
        public struct Buy: WatchWhatSchema.SelectionSet {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public static var __parentType: ApolloAPI.ParentType { WatchWhatSchema.Objects.Provider }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("display_priority", Int?.self),
            .field("logo_path", String?.self),
            .field("provider_name", String.self),
            .field("provider_id", Int.self),
          ] }

          public var display_priority: Int? { __data["display_priority"] }
          public var logo_path: String? { __data["logo_path"] }
          public var provider_name: String { __data["provider_name"] }
          public var provider_id: Int { __data["provider_id"] }
        }

        /// Providers.Rent
        ///
        /// Parent Type: `Provider`
        public struct Rent: WatchWhatSchema.SelectionSet {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public static var __parentType: ApolloAPI.ParentType { WatchWhatSchema.Objects.Provider }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("display_priority", Int?.self),
            .field("logo_path", String?.self),
            .field("provider_name", String.self),
            .field("provider_id", Int.self),
          ] }

          public var display_priority: Int? { __data["display_priority"] }
          public var logo_path: String? { __data["logo_path"] }
          public var provider_name: String { __data["provider_name"] }
          public var provider_id: Int { __data["provider_id"] }
        }

        /// Providers.Flatrate
        ///
        /// Parent Type: `Provider`
        public struct Flatrate: WatchWhatSchema.SelectionSet {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public static var __parentType: ApolloAPI.ParentType { WatchWhatSchema.Objects.Provider }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("display_priority", Int?.self),
            .field("logo_path", String?.self),
            .field("provider_name", String.self),
            .field("provider_id", Int.self),
          ] }

          public var display_priority: Int? { __data["display_priority"] }
          public var logo_path: String? { __data["logo_path"] }
          public var provider_name: String { __data["provider_name"] }
          public var provider_id: Int { __data["provider_id"] }
        }
      }
    }
  }

}