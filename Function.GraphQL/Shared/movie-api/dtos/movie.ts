import { Genre } from "./genre";

export type Movie = {
  adult: boolean,
  backdrop_path: string,
  genre_ids: number[],
  id: number,
  original_language: string,
  original_title: string,
  overview: string,
  popularity: number,
  poster_path: string,
  release_date: Date,
  title: string,
  video: boolean,
  vote_average: number,
  vote_count: number
};

// This property is likely a collection group.
// belongs_to_collection: any | null,
export type MovieDetails = {
  adult: boolean,
  backdrop_path: string,
  budget: number,
  id: number,
  genres: Genre[],
  homepage: string,
  imdb_id: string,
  original_language: string,
  original_title: string,
  overview: string,
  popularity: number,
  poster_path: string,
  production_companies: ProductionCompany[],
  production_countries: ProductionCountry[],
  release_date: Date,
  revenue: number,
  runtime: number,
  spoken_languages: SpokenLanguages[],
  status: string,
  tagline: string,
  title: string,
  video: boolean,
  vote_average: number,
  vote_count: number
};

type ProductionCompany = {
  id: number,
  logo_path: string,
  name: string,
  origin_country: string
};

type ProductionCountry = {
  iso_3166_1: string,
  name: string
}

type SpokenLanguages = {
  english_name: string,
  iso_639_1: string,
  name: string
}