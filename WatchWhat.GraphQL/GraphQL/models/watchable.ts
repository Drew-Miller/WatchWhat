import { MovieResult } from "../../Shared/tmdb/dtos/movie";
import { TVResult } from "../../Shared/tmdb/dtos/tv";

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

  static fromMovieResult(result: MovieResult): Watchable {
    const watchable = new Watchable();

    watchable.id = result.id;
    watchable.title = result.title;
    watchable.mediaType = "tv";
    watchable.backdropPath = result.backdrop_path;
    watchable.posterPath = result.poster_path;
    watchable.genreIds = result.genre_ids;
    watchable.releaseDate = result.release_date;
    watchable.voteAverage = result.vote_average;

    return watchable;
  }

  static fromTVResult(result: TVResult): Watchable {
    const watchable = new Watchable();

    watchable.id = result.id;
    watchable.title = result.name;
    watchable.mediaType = "tv";
    watchable.backdropPath = result.backdrop_path;
    watchable.posterPath = result.poster_path;
    watchable.genreIds = result.genre_ids;
    watchable.releaseDate = result.first_air_date;
    watchable.voteAverage = result.vote_average;

    return watchable;
  }
};