// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public extension WatchWhatSchema {
  class CreditsQuery: GraphQLQuery {
    public static let operationName: String = "Credits"
    public static let document: ApolloAPI.DocumentType = .notPersisted(
      definition: .init(
        #"""
        query Credits($id: Int!) {
          credits(id: $id) {
            __typename
            id
            cast {
              __typename
              adult
              cast_id
              character
              credit_id
              gender
              id
              known_for_department
              name
              order
              original_name
              popularity
              profile_path
            }
            crew {
              __typename
              adult
              credit_id
              department
              gender
              id
              job
              known_for_department
              name
              original_name
              popularity
              profile_path
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
        .field("credits", Credits.self, arguments: ["id": .variable("id")]),
      ] }

      public var credits: Credits { __data["credits"] }

      /// Credits
      ///
      /// Parent Type: `Credits`
      public struct Credits: WatchWhatSchema.SelectionSet {
        public let __data: DataDict
        public init(data: DataDict) { __data = data }

        public static var __parentType: ApolloAPI.ParentType { WatchWhatSchema.Objects.Credits }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("id", Int.self),
          .field("cast", [Cast].self),
          .field("crew", [Crew].self),
        ] }

        public var id: Int { __data["id"] }
        public var cast: [Cast] { __data["cast"] }
        public var crew: [Crew] { __data["crew"] }

        /// Credits.Cast
        ///
        /// Parent Type: `Cast`
        public struct Cast: WatchWhatSchema.SelectionSet {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public static var __parentType: ApolloAPI.ParentType { WatchWhatSchema.Objects.Cast }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("adult", Bool.self),
            .field("cast_id", Int.self),
            .field("character", String.self),
            .field("credit_id", String.self),
            .field("gender", Int.self),
            .field("id", Int.self),
            .field("known_for_department", String.self),
            .field("name", String.self),
            .field("order", Int.self),
            .field("original_name", String.self),
            .field("popularity", Double.self),
            .field("profile_path", String?.self),
          ] }

          public var adult: Bool { __data["adult"] }
          public var cast_id: Int { __data["cast_id"] }
          public var character: String { __data["character"] }
          public var credit_id: String { __data["credit_id"] }
          public var gender: Int { __data["gender"] }
          public var id: Int { __data["id"] }
          public var known_for_department: String { __data["known_for_department"] }
          public var name: String { __data["name"] }
          public var order: Int { __data["order"] }
          public var original_name: String { __data["original_name"] }
          public var popularity: Double { __data["popularity"] }
          public var profile_path: String? { __data["profile_path"] }
        }

        /// Credits.Crew
        ///
        /// Parent Type: `Crew`
        public struct Crew: WatchWhatSchema.SelectionSet {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public static var __parentType: ApolloAPI.ParentType { WatchWhatSchema.Objects.Crew }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("adult", Bool.self),
            .field("credit_id", String.self),
            .field("department", String.self),
            .field("gender", Int.self),
            .field("id", Int.self),
            .field("job", String.self),
            .field("known_for_department", String.self),
            .field("name", String.self),
            .field("original_name", String.self),
            .field("popularity", Double.self),
            .field("profile_path", String?.self),
          ] }

          public var adult: Bool { __data["adult"] }
          public var credit_id: String { __data["credit_id"] }
          public var department: String { __data["department"] }
          public var gender: Int { __data["gender"] }
          public var id: Int { __data["id"] }
          public var job: String { __data["job"] }
          public var known_for_department: String { __data["known_for_department"] }
          public var name: String { __data["name"] }
          public var original_name: String { __data["original_name"] }
          public var popularity: Double { __data["popularity"] }
          public var profile_path: String? { __data["profile_path"] }
        }
      }
    }
  }

}