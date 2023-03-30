import { Company, Country, Genre, SpokenLanguages } from "../.";

// This property is likely a collection group.
// belongs_to_collection: any | null,
export type TV = {
  adult: boolean,
  backdrop_path: string,
  createdBy: CreatedBy[],
  episode_run_time: number[],
  first_air_date: Date,
  genres: Genre[],
  homepage: string,
  id: number,
  in_production: boolean,
  languages: string[],
  last_air_date: Date,
  last_episode_to_air: Episode,
  name: string,
  next_episode_to_air?: Episode,
  networks: Company[],
  number_of_episodes: number,
  number_of_seasons: number,
  origin_country: string[],
  original_language: string,
  original_name: string,
  overview: string,
  popularity: number,
  poster_path: string,
  production_companies: Company[],
  production_countries: Country[],
  seasons: Season[],
  spoken_languages: SpokenLanguages[],
  status: string,
  tagline: string,
  type: string,
  vote_average: number,
  vote_count: number
};

type CreatedBy = {
  id: number,
  credit_id: string,
  name: string,
  gender: number,
  profile_path: string
}

type Episode = {
  id: number,
  name: string,
  overview: string,
  vote_average: number,
  vote_count: number,
  air_date: Date,
  episode_number: number,
  production_code: string,
  runtime: number,
  season_number: number,
  show_id: number,
  still_path: string
};

type Season = {
  air_date: Date,
  episode_count: number,
  id: number,
  name: string,
  overview: string,
  poster_path: string,
  season_number: number
}

