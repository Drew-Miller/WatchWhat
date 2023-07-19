import { MovieResult } from "../../Shared/tmdb/dtos/movie";
import { TVResult } from "../../Shared/tmdb/dtos/tv";
import { Watchable } from "../models/watchable";

class WatchableMapper {
  fromMovieResult(dto: MovieResult): Watchable {
    const watchable = new Watchable();

    watchable.id = dto.id;
    watchable.title = dto.title;
    watchable.mediaType = "movie";
    watchable.backdropPath = dto.backdrop_path;
    watchable.posterPath = dto.poster_path;
    watchable.genreIds = dto.genre_ids;
    watchable.releaseDate = dto.release_date;
    watchable.voteAverage = dto.vote_average;

    return watchable;
  }

  fromTVResult(dto: TVResult): Watchable {
    const watchable = new Watchable();

    watchable.id = dto.id;
    watchable.title = dto.name;
    watchable.mediaType = "tv";
    watchable.backdropPath = dto.backdrop_path;
    watchable.posterPath = dto.poster_path;
    watchable.genreIds = dto.genre_ids;
    watchable.releaseDate = dto.first_air_date;
    watchable.voteAverage = dto.vote_average;

    return watchable;
  }
}

const watchableMapper = new WatchableMapper();

export { watchableMapper };