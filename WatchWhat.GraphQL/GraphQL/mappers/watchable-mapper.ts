import { MovieResult } from "../../Shared/tmdb/dtos/movie";
import { TVResult } from "../../Shared/tmdb/dtos/tv";
import { Watchable } from "../models/watchable";

class WatchableMapper {
  fromMovieResult(result: MovieResult): Watchable {
    const watchable = new Watchable();

    watchable.id = result.id;
    watchable.title = result.title;
    watchable.mediaType = "movie";
    watchable.backdropPath = result.backdrop_path;
    watchable.posterPath = result.poster_path;
    watchable.genreIds = result.genre_ids;
    watchable.releaseDate = result.release_date;
    watchable.voteAverage = result.vote_average;

    return watchable;
  }

  fromTVResult(result: TVResult): Watchable {
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
}

const watchableMapper = new WatchableMapper();

export { watchableMapper };