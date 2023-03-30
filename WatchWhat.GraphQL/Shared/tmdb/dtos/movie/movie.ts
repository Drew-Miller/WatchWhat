import { Company, Genre, SpokenLanguages } from "../.";

// This property is likely a collection group.
// belongs_to_collection: any | null,
export type Movie = {
  adult: boolean,
  backdrop_path?: string,
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
  production_companies: Company[],
  production_countries: Company[],
  release_date?: Date,
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