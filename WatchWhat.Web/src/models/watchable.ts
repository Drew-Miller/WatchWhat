export type Watchable = {
  id: number;
  imdbId: number;
  title: string;
  mediaType: "movie" | "tv";
  posterPath: string;
  backdropPath: string;
  releaseDate: string;
  voteAverage: string;
};