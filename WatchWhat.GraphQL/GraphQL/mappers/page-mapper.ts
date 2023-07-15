import { MediaResult } from "../../Shared/tmdb";
import { Page as PageDto } from "../../Shared/tmdb/dtos";
import { MovieResult } from "../../Shared/tmdb/dtos/movie";
import { TVResult } from "../../Shared/tmdb/dtos/tv";
import { Page } from "../models/page";
import { Watchable } from "../models/watchable";

class WatchableMapper {
  fromMovieResult(result: MovieResult): Watchable {
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

  fromTVResult(result: TVResult): Watchable {
    const watchable = new Watchable();

    watchable.id = result.id;
    watchable.title = result.name;
    watchable.mediaType = "movie";
    watchable.backdropPath = result.backdrop_path;
    watchable.posterPath = result.poster_path;
    watchable.genreIds = result.genre_ids;
    watchable.releaseDate = result.first_air_date;
    watchable.voteAverage = result.vote_average;

    return watchable;
  }
}

class PageMapper {
  watchableMapper: WatchableMapper;

  constructor() {
    this.watchableMapper = new WatchableMapper();
  }

  fromMediaResult(data: PageDto<MediaResult>): Page<Watchable> {
    const page = new Page<Watchable>(data);

    const results = data.results.map(result => {
      switch(result.media_type) {
        case "tv":
          return this.watchableMapper.fromTVResult(result as TVResult);
        case "movie":
          return this.watchableMapper.fromMovieResult(result as MovieResult);
        default:
          return null;
      }
    });

    page.results = results.filter(x => !!x);

    return page;
  }
}

const pageMapper = new PageMapper();

export { pageMapper };