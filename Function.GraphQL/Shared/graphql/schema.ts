export const typeDefs = `#graphql

type Query {
  hello: String
  ping: String

  #### Calls ####

  discover: Discover!

  #### Watchmode ####

  webUrl(tmdbId: Int!, titleType: String, sourceName: String!): String!

  #### TMDB ####

  regions: [Region!]!

  movieProviders(region: String): [Provider!]!

  watchMovie(movieId: Int!, region: String!):  WatchProviders!

  popularMovies(page: Int): PaginatedMovies!
  
  searchMovies(query: String!, page: Int): PaginatedMovies!

  genres: [Genre!]!
  moviesByGenre(genreIds: [Int], page: Int): PaginatedMovies!

  movie(id: Int!): MovieDetails!
  credits(id: Int!): Credits!
  videos(id: Int!): TrailerResults!
  recommendations(id: Int!): PaginatedRecommendations!
}


################
# Custom Types #
################

type Discover {
  results: [GroupedMovies!]!
}

type GroupedMovies {
  id: Int!
  title: String!
  movies: [Movie!]!
}


##############
# TMDB Types #
##############

# Providers

type Region {
  iso_3166_1: String
  english_name: String
  native_name: String
}

type Provider {
  display_priority: Int!
  logo_path: String
  provider_name: String!
  provider_id: Int!
}

type WatchProviders {
  link: String!
  buy: [Provider!]
  rent: [Provider!]
  flatrate: [Provider!]
}

# Genre Types

type Genre {
  id: Int!
  name: String!
}

type PaginatedMovies {
  page: Int!
  results: [Movie!]!
  total_pages: Int!
  total_results: Int!
}

type Movie {
  adult: Boolean!
  backdrop_path: String
  genre_ids: [Int!]!
  id: Int!
  original_language: String!
  original_title: String!
  overview: String!
  popularity: Float!
  poster_path: String
  release_date: String!
  title: String!
  video: Boolean!
  vote_average: Float!
  vote_count: Int!
}


# Movie Types

type MovieDetails {
  adult: Boolean!
  backdrop_path: String
  budget: Int!
  genres: [Genre!]!
  homepage: String!
  id: Int!
  imdb_id: String!
  original_language: String!
  original_title: String!
  overview: String!
  popularity: Float!
  poster_path: String
  production_companies: [ProductionCompany!]!
  production_countries: [ProductionCountry!]!
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

type ProductionCompany {
  id: Int!
  logo_path: String
  name: String!
  origin_country: String!
}

type ProductionCountry {
  iso_3166_1: String!
  name: String!
}

type SpokenLanguages {
  english_name: String!
  iso_639_1: String!
  name: String!
}


# Credits Types

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

type Credits {
  cast: [Cast!]!
  crew: [Crew!]!
  id: Int!
}


# Trailer Types

type TrailerResults {
  id: Int!
  results: [Trailer!]!
}

type Trailer {
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


# Recommendation Types

type Recommendation {
  adult: Boolean!
  backdrop_path: String
  genre_ids: [Int!]!
  id: Int!
  media_type: String!
  original_language: String!
  original_title: String!
  overview: String!
  popularity: Float!
  poster_path: String
  release_date: String!
  title: String!
  video: Boolean!
  vote_average: Float!
}

type PaginatedRecommendations {
  page: Int!
  results: [Recommendation!]!
  total_pages: Int!
  total_results: Int!
}


###################
# Watchmode Types #
###################

type Source {
  source_id: Int
  name: String!
  type: String!
  region: String!
  ios_url: String
  android_url: String
  web_url: String!
  format: Int!
  price: Int
  seasons: Int
  episodes: Int
}

`;