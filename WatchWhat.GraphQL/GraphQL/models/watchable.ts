export class Watchable {
  __typename = "Watchable";
  id: number;
  title: string;
  mediaType: "movie" | "tv";
  backdropPath?: string;
  posterPath?: string;
  genreIds: number[];
  releaseDate: Date;
  voteAverage: number;
};