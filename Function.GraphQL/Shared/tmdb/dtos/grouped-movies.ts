import { Movie } from "./movie";

export type GroupedMovies = {
  id: number,
  title: string,
  movies: Movie[]
};