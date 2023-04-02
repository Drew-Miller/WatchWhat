// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public extension WatchWhatSchema {
  class TVQuery: GraphQLQuery {
    public static let operationName: String = "TV"
    public static let document: ApolloAPI.DocumentType = .notPersisted(
      definition: .init(
        #"""
        query TV($tvId: Int!) {
          tv(id: $tvId) {
            __typename
            adult
            backdrop_path
            content_rating
            created_by {
              __typename
              id
              credit_id
              name
              gender
              profile_path
            }
            episode_run_time
            first_air_date
            genres {
              __typename
              id
              name
            }
            homepage
            id
            in_production
            languages
            last_air_date
            last_episode_to_air {
              __typename
              id
              name
              overview
              vote_average
              vote_count
              air_date
              episode_number
              production_code
              runtime
              season_number
              show_id
              still_path
            }
            name
            next_episode_to_air {
              __typename
              id
              name
              overview
              vote_average
              vote_count
              air_date
              episode_number
              production_code
              runtime
              season_number
              show_id
              still_path
            }
            networks {
              __typename
              id
              logo_path
              name
              origin_country
            }
            number_of_episodes
            number_of_seasons
            origin_country
            original_language
            original_name
            overview
            popularity
            poster_path
            production_companies {
              __typename
              id
              logo_path
              name
              origin_country
            }
            production_countries {
              __typename
              iso_3166_1
              name
            }
            seasons {
              __typename
              air_date
              episode_count
              id
              name
              overview
              poster_path
              season_number
            }
            spoken_languages {
              __typename
              english_name
              iso_639_1
              name
            }
            status
            tagline
            type
            vote_average
            vote_count
          }
        }
        """#
      ))

    public var tvId: Int

    public init(tvId: Int) {
      self.tvId = tvId
    }

    public var __variables: Variables? { ["tvId": tvId] }

    public struct Data: WatchWhatSchema.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ApolloAPI.ParentType { WatchWhatSchema.Objects.Query }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("tv", Tv.self, arguments: ["id": .variable("tvId")]),
      ] }

      public var tv: Tv { __data["tv"] }

      /// Tv
      ///
      /// Parent Type: `TV`
      public struct Tv: WatchWhatSchema.SelectionSet {
        public let __data: DataDict
        public init(data: DataDict) { __data = data }

        public static var __parentType: ApolloAPI.ParentType { WatchWhatSchema.Objects.TV }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("adult", Bool.self),
          .field("backdrop_path", String?.self),
          .field("content_rating", String.self),
          .field("created_by", [Created_by].self),
          .field("episode_run_time", [Int].self),
          .field("first_air_date", String.self),
          .field("genres", [Genre].self),
          .field("homepage", String.self),
          .field("id", Int.self),
          .field("in_production", Bool.self),
          .field("languages", [String].self),
          .field("last_air_date", String.self),
          .field("last_episode_to_air", Last_episode_to_air?.self),
          .field("name", String.self),
          .field("next_episode_to_air", Next_episode_to_air?.self),
          .field("networks", [Network].self),
          .field("number_of_episodes", Int.self),
          .field("number_of_seasons", Int?.self),
          .field("origin_country", [String].self),
          .field("original_language", String.self),
          .field("original_name", String.self),
          .field("overview", String.self),
          .field("popularity", Double.self),
          .field("poster_path", String?.self),
          .field("production_companies", [Production_company].self),
          .field("production_countries", [Production_country].self),
          .field("seasons", [Season].self),
          .field("spoken_languages", [Spoken_language].self),
          .field("status", String.self),
          .field("tagline", String.self),
          .field("type", String.self),
          .field("vote_average", Double.self),
          .field("vote_count", Int.self),
        ] }

        public var adult: Bool { __data["adult"] }
        public var backdrop_path: String? { __data["backdrop_path"] }
        public var content_rating: String { __data["content_rating"] }
        public var created_by: [Created_by] { __data["created_by"] }
        public var episode_run_time: [Int] { __data["episode_run_time"] }
        public var first_air_date: String { __data["first_air_date"] }
        public var genres: [Genre] { __data["genres"] }
        public var homepage: String { __data["homepage"] }
        public var id: Int { __data["id"] }
        public var in_production: Bool { __data["in_production"] }
        public var languages: [String] { __data["languages"] }
        public var last_air_date: String { __data["last_air_date"] }
        public var last_episode_to_air: Last_episode_to_air? { __data["last_episode_to_air"] }
        public var name: String { __data["name"] }
        public var next_episode_to_air: Next_episode_to_air? { __data["next_episode_to_air"] }
        public var networks: [Network] { __data["networks"] }
        public var number_of_episodes: Int { __data["number_of_episodes"] }
        public var number_of_seasons: Int? { __data["number_of_seasons"] }
        public var origin_country: [String] { __data["origin_country"] }
        public var original_language: String { __data["original_language"] }
        public var original_name: String { __data["original_name"] }
        public var overview: String { __data["overview"] }
        public var popularity: Double { __data["popularity"] }
        public var poster_path: String? { __data["poster_path"] }
        public var production_companies: [Production_company] { __data["production_companies"] }
        public var production_countries: [Production_country] { __data["production_countries"] }
        public var seasons: [Season] { __data["seasons"] }
        public var spoken_languages: [Spoken_language] { __data["spoken_languages"] }
        public var status: String { __data["status"] }
        public var tagline: String { __data["tagline"] }
        public var type: String { __data["type"] }
        public var vote_average: Double { __data["vote_average"] }
        public var vote_count: Int { __data["vote_count"] }

        /// Tv.Created_by
        ///
        /// Parent Type: `CreatedBy`
        public struct Created_by: WatchWhatSchema.SelectionSet {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public static var __parentType: ApolloAPI.ParentType { WatchWhatSchema.Objects.CreatedBy }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("id", Int.self),
            .field("credit_id", String.self),
            .field("name", String.self),
            .field("gender", Int.self),
            .field("profile_path", String.self),
          ] }

          public var id: Int { __data["id"] }
          public var credit_id: String { __data["credit_id"] }
          public var name: String { __data["name"] }
          public var gender: Int { __data["gender"] }
          public var profile_path: String { __data["profile_path"] }
        }

        /// Tv.Genre
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

        /// Tv.Last_episode_to_air
        ///
        /// Parent Type: `Episode`
        public struct Last_episode_to_air: WatchWhatSchema.SelectionSet {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public static var __parentType: ApolloAPI.ParentType { WatchWhatSchema.Objects.Episode }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("id", Int.self),
            .field("name", String.self),
            .field("overview", String.self),
            .field("vote_average", Double.self),
            .field("vote_count", Int.self),
            .field("air_date", String.self),
            .field("episode_number", String.self),
            .field("production_code", String.self),
            .field("runtime", Int.self),
            .field("season_number", Int.self),
            .field("show_id", Int.self),
            .field("still_path", String.self),
          ] }

          public var id: Int { __data["id"] }
          public var name: String { __data["name"] }
          public var overview: String { __data["overview"] }
          public var vote_average: Double { __data["vote_average"] }
          public var vote_count: Int { __data["vote_count"] }
          public var air_date: String { __data["air_date"] }
          public var episode_number: String { __data["episode_number"] }
          public var production_code: String { __data["production_code"] }
          public var runtime: Int { __data["runtime"] }
          public var season_number: Int { __data["season_number"] }
          public var show_id: Int { __data["show_id"] }
          public var still_path: String { __data["still_path"] }
        }

        /// Tv.Next_episode_to_air
        ///
        /// Parent Type: `Episode`
        public struct Next_episode_to_air: WatchWhatSchema.SelectionSet {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public static var __parentType: ApolloAPI.ParentType { WatchWhatSchema.Objects.Episode }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("id", Int.self),
            .field("name", String.self),
            .field("overview", String.self),
            .field("vote_average", Double.self),
            .field("vote_count", Int.self),
            .field("air_date", String.self),
            .field("episode_number", String.self),
            .field("production_code", String.self),
            .field("runtime", Int.self),
            .field("season_number", Int.self),
            .field("show_id", Int.self),
            .field("still_path", String.self),
          ] }

          public var id: Int { __data["id"] }
          public var name: String { __data["name"] }
          public var overview: String { __data["overview"] }
          public var vote_average: Double { __data["vote_average"] }
          public var vote_count: Int { __data["vote_count"] }
          public var air_date: String { __data["air_date"] }
          public var episode_number: String { __data["episode_number"] }
          public var production_code: String { __data["production_code"] }
          public var runtime: Int { __data["runtime"] }
          public var season_number: Int { __data["season_number"] }
          public var show_id: Int { __data["show_id"] }
          public var still_path: String { __data["still_path"] }
        }

        /// Tv.Network
        ///
        /// Parent Type: `Company`
        public struct Network: WatchWhatSchema.SelectionSet {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public static var __parentType: ApolloAPI.ParentType { WatchWhatSchema.Objects.Company }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("id", Int.self),
            .field("logo_path", String?.self),
            .field("name", String.self),
            .field("origin_country", String.self),
          ] }

          public var id: Int { __data["id"] }
          public var logo_path: String? { __data["logo_path"] }
          public var name: String { __data["name"] }
          public var origin_country: String { __data["origin_country"] }
        }

        /// Tv.Production_company
        ///
        /// Parent Type: `Company`
        public struct Production_company: WatchWhatSchema.SelectionSet {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public static var __parentType: ApolloAPI.ParentType { WatchWhatSchema.Objects.Company }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("id", Int.self),
            .field("logo_path", String?.self),
            .field("name", String.self),
            .field("origin_country", String.self),
          ] }

          public var id: Int { __data["id"] }
          public var logo_path: String? { __data["logo_path"] }
          public var name: String { __data["name"] }
          public var origin_country: String { __data["origin_country"] }
        }

        /// Tv.Production_country
        ///
        /// Parent Type: `Country`
        public struct Production_country: WatchWhatSchema.SelectionSet {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public static var __parentType: ApolloAPI.ParentType { WatchWhatSchema.Objects.Country }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("iso_3166_1", String.self),
            .field("name", String.self),
          ] }

          public var iso_3166_1: String { __data["iso_3166_1"] }
          public var name: String { __data["name"] }
        }

        /// Tv.Season
        ///
        /// Parent Type: `Season`
        public struct Season: WatchWhatSchema.SelectionSet {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public static var __parentType: ApolloAPI.ParentType { WatchWhatSchema.Objects.Season }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("air_date", String.self),
            .field("episode_count", Int.self),
            .field("id", Int.self),
            .field("name", String.self),
            .field("overview", String.self),
            .field("poster_path", String?.self),
            .field("season_number", Int.self),
          ] }

          public var air_date: String { __data["air_date"] }
          public var episode_count: Int { __data["episode_count"] }
          public var id: Int { __data["id"] }
          public var name: String { __data["name"] }
          public var overview: String { __data["overview"] }
          public var poster_path: String? { __data["poster_path"] }
          public var season_number: Int { __data["season_number"] }
        }

        /// Tv.Spoken_language
        ///
        /// Parent Type: `SpokenLanguages`
        public struct Spoken_language: WatchWhatSchema.SelectionSet {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public static var __parentType: ApolloAPI.ParentType { WatchWhatSchema.Objects.SpokenLanguages }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("english_name", String.self),
            .field("iso_639_1", String.self),
            .field("name", String.self),
          ] }

          public var english_name: String { __data["english_name"] }
          public var iso_639_1: String { __data["iso_639_1"] }
          public var name: String { __data["name"] }
        }
      }
    }
  }

}