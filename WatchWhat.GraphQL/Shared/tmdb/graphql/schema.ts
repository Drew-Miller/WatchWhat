export const tmdbTypeDefs = `#graphql

type Query {

  # TMDB
  
  trending(media: String!, time: String!): PageMedia!
  discover(media: String!, params: DiscoverParams): PageMedia!
  search(media: String!, params: SearchParams!): PageMedia!
  popular(media: String!, params: PopularParams): PageMedia!
  similar(media: String!, id: Int!): PageMedia!
  recommendations(media: String!, id: Int!): PageMedia!

  videos(media: String!, id: Int!): PageVideo!
  credits(media: String!, id: Int!): Credits!
  providers(media: String!, id: Int!, region: String!): ProviderTypes!

  genres(media: String!): [Genre!]!
  allProviders(media: String!): [Provider!]!
  regions: [Region!]!

  # Movies

  movie(id: Int!): Movie

  # TV

  tv(id: Int!): TV
}

input DiscoverParams {
  page: Int
  genreIds: [Int!]
}

input SearchParams {
  language: String
  query: String!
  page: Int
  includeAdult: Boolean
  region: String
}

input PopularParams {
  page: Int
  region: String
}

##############
# TMDB Types #
##############

type PageMedia {
  page: Int!
  total_pages: Int!
  total_results: Int!
  results: [MediaResult!]!
}

type PageVideo {
  page: Int!
  total_pages: Int!
  total_results: Int!
  results: [Video!]!
}

type Genre {
  id: Int!
  name: String!
}

# Providers #
#############

type ProviderTypes {
  link: String!
  buy: [Provider!]
  rent: [Provider!]
  flatrate: [Provider!]
}

type Provider {
  display_priority: Int!
  logo_path: String
  provider_name: String!
  provider_id: Int!
}

type Region {
  iso_3166_1: String
  english_name: String
  native_name: String
}

### Media ###
#############

type PaginatedMovies {
  page: Int!
  results: [Movie!]!
  total_pages: Int!
  total_results: Int!
}

type MediaResult {
  adult: Boolean!
  backdrop_path: String
  genre_ids: [Int!]!
  id: Int!
  name: String!
  overview: String!
  poster_path: String
  release_date: String
  mediaType: String!
}

### Movie ###
#############

type Movie {
  adult: Boolean!
  backdrop_path: String
  budget: Int!
  genres: [Genre!]!
  homepage: String!
  id: Int!
  imdb_id: String!
  mpaa_rating: String!
  original_language: String!
  original_title: String!
  overview: String!
  popularity: Float!
  poster_path: String
  production_companies: [Company!]!
  production_countries: [Country!]!
  release_date: String!
  revenue: Int!
  runtime: Int!
  spoken_languages: [SpokenLanguages!]!
  status: String!
  tagline: String!
  title: String!
  video: Boolean!
  vote_average: Float!
  vote_count: Int!
}

#### TV #####
#############

type TV {
  adult: Boolean!
  backdrop_path: String
  budget: Int!
  genres: [Genre!]!
  homepage: String!
  id: Int!
  imdb_id: String!
  mpaa_rating: String!
  original_language: String!
  original_title: String!
  overview: String!
  popularity: Float!
  poster_path: String
  production_companies: [Company!]!
  production_countries: [Country!]!
  release_date: String!
  revenue: Int!
  runtime: Int!
  spoken_languages: [SpokenLanguages!]!
  status: String!
  tagline: String!
  title: String!
  video: Boolean!
  vote_average: Float!
  vote_count: Int!
}

# Production #
##############

type Company {
  id: Int!
  logo_path: String
  name: String!
  origin_country: String!
}

type Country {
  iso_3166_1: String!
  name: String!
}

type SpokenLanguages {
  english_name: String!
  iso_639_1: String!
  name: String!
}

### Video ###
#############

type Videos {
  id: Int!
  results: [Video!]!
}

type Video {
  id: String!
  iso_639_1: String!
  iso_3166_1: String!
  key: String!
  name: String
  official: Boolean!
  published_at: String!
  site: String!
  size: Int!
  type: String!
}

## Credits ##
#############

type Credits {
  cast: [Cast!]!
  crew: [Crew!]!
  id: Int!
}

type Cast {
  adult: Boolean!
  cast_id: Int!
  character: String!
  credit_id: String!
  gender: Int!
  id: Int!
  known_for_department: String!
  name: String!
  order: Int!
  original_name: String!
  popularity: Float!
  profile_path: String
}

type Crew {
  adult: Boolean!
  credit_id: String!
  department: String!
  gender: Int!
  id: Int!
  job: String!
  known_for_department: String!
  name: String!
  original_name: String!
  popularity: Float!
  profile_path: String
}

`;