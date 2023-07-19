import type { Genre } from "./genre";

export type Movie = {
  id: number;
  imdbId: string;
  title: string;
  overview: string;
  posterPath: string;
  backdropPath?: string;
  genres: Genre[];
  rating: string;
  releaseDate: Date;
  voteAverage: number;
};