export const typeDefs = `#graphql

type Query {
  hello: String
  ping: String
  
  searchMovies(query: String!, page: Int): PaginatedMovies

  genres: [Genre]
  moviesByGenre(genreIds: [Int], page: Int): PaginatedMovies
}

################
# Custom Types #
################



##################
# Movie DB Types #
##################

# Genre Types

type Genre {
  id: Int!
  name: String!
}

type PaginatedMovies {
  page: Int!
  results: [Movie]
  total_pages: Int!
  total_results: Int!
}

type Movie {
  adult: Boolean!
  backdrop_path: String
  genre_ids: [Int]
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
  genres: [Genre]
  homepage: String!
  id: Int!
  imdb_id: String!
  original_language: String!
  original_title: String!
  overview: String!
  popularity: Float!
  poster_path: String
  production_companies: [ProductionCompany]
  production_countries: [ProductionCountry]
  release_date: String!
  revenue: Int!
  runtime: Int!
  spoken_languages: [SpokenLanguages]
  status: String!
  tagline: String!
  title: String!
  video: Boolean!
  vote_average: Float!
  vote_count: Int!
}

type ProductionCompany {
  id: Int!
  logo_path: String!
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


# Trailer Types

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


# Wrapped Results
# type Results {
#   id: Int!
#   results: [Resultable]
# }

`;