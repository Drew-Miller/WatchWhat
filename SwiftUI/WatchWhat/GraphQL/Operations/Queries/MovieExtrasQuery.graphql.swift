// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public extension WatchWhatSchema {
  class MovieExtrasQuery: GraphQLQuery {
    public static let operationName: String = "MovieExtras"
    public static let document: ApolloAPI.DocumentType = .notPersisted(
      definition: .init(
        #"""
        query MovieExtras($id: Int!) {
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
          videos(id: $id) {
            __typename
            id
            results {
              __typename
              id
              iso_639_1
              iso_3166_1
              key
              name
              official
              published_at
              site
              size
              type
            }
          }
          recommendations(id: $id) {
            __typename
            page
            total_pages
            total_results
            results {
              __typename
              adult
              backdrop_path
              genre_ids
              id
              media_type
              original_language
              original_title
              overview
              popularity
              poster_path
              release_date
              title
              video
              vote_average
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
        .field("videos", Videos.self, arguments: ["id": .variable("id")]),
        .field("recommendations", Recommendations.self, arguments: ["id": .variable("id")]),
      ] }

      public var credits: Credits { __data["credits"] }
      public var videos: Videos { __data["videos"] }
      public var recommendations: Recommendations { __data["recommendations"] }

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

      /// Videos
      ///
      /// Parent Type: `TrailerResults`
      public struct Videos: WatchWhatSchema.SelectionSet {
        public let __data: DataDict
        public init(data: DataDict) { __data = data }

        public static var __parentType: ApolloAPI.ParentType { WatchWhatSchema.Objects.TrailerResults }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("id", Int.self),
          .field("results", [Result].self),
        ] }

        public var id: Int { __data["id"] }
        public var results: [Result] { __data["results"] }

        /// Videos.Result
        ///
        /// Parent Type: `Trailer`
        public struct Result: WatchWhatSchema.SelectionSet {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public static var __parentType: ApolloAPI.ParentType { WatchWhatSchema.Objects.Trailer }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("id", String.self),
            .field("iso_639_1", String.self),
            .field("iso_3166_1", String.self),
            .field("key", String.self),
            .field("name", String?.self),
            .field("official", Bool.self),
            .field("published_at", String.self),
            .field("site", String.self),
            .field("size", Int.self),
            .field("type", String.self),
          ] }

          public var id: String { __data["id"] }
          public var iso_639_1: String { __data["iso_639_1"] }
          public var iso_3166_1: String { __data["iso_3166_1"] }
          public var key: String { __data["key"] }
          public var name: String? { __data["name"] }
          public var official: Bool { __data["official"] }
          public var published_at: String { __data["published_at"] }
          public var site: String { __data["site"] }
          public var size: Int { __data["size"] }
          public var type: String { __data["type"] }
        }
      }

      /// Recommendations
      ///
      /// Parent Type: `PaginatedRecommendations`
      public struct Recommendations: WatchWhatSchema.SelectionSet {
        public let __data: DataDict
        public init(data: DataDict) { __data = data }

        public static var __parentType: ApolloAPI.ParentType { WatchWhatSchema.Objects.PaginatedRecommendations }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("page", Int.self),
          .field("total_pages", Int.self),
          .field("total_results", Int.self),
          .field("results", [Result].self),
        ] }

        public var page: Int { __data["page"] }
        public var total_pages: Int { __data["total_pages"] }
        public var total_results: Int { __data["total_results"] }
        public var results: [Result] { __data["results"] }

        /// Recommendations.Result
        ///
        /// Parent Type: `Recommendation`
        public struct Result: WatchWhatSchema.SelectionSet {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public static var __parentType: ApolloAPI.ParentType { WatchWhatSchema.Objects.Recommendation }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("adult", Bool.self),
            .field("backdrop_path", String?.self),
            .field("genre_ids", [Int].self),
            .field("id", Int.self),
            .field("media_type", String.self),
            .field("original_language", String.self),
            .field("original_title", String.self),
            .field("overview", String.self),
            .field("popularity", Double.self),
            .field("poster_path", String?.self),
            .field("release_date", String.self),
            .field("title", String.self),
            .field("video", Bool.self),
            .field("vote_average", Double.self),
          ] }

          public var adult: Bool { __data["adult"] }
          public var backdrop_path: String? { __data["backdrop_path"] }
          public var genre_ids: [Int] { __data["genre_ids"] }
          public var id: Int { __data["id"] }
          public var media_type: String { __data["media_type"] }
          public var original_language: String { __data["original_language"] }
          public var original_title: String { __data["original_title"] }
          public var overview: String { __data["overview"] }
          public var popularity: Double { __data["popularity"] }
          public var poster_path: String? { __data["poster_path"] }
          public var release_date: String { __data["release_date"] }
          public var title: String { __data["title"] }
          public var video: Bool { __data["video"] }
          public var vote_average: Double { __data["vote_average"] }
        }
      }
    }
  }

}