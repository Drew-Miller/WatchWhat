import { MediaResult, Page as PageDto } from "../../Shared/tmdb/dtos";
import { MovieResult } from "../../Shared/tmdb/dtos/movie";
import { TVResult } from "../../Shared/tmdb/dtos/tv";
import { Page } from "../models/page";
import { Watchable } from "../models/watchable";
import { watchableMapper } from "./watchable-mapper";

class WatchablePageMapper {
  fromMediaResult(data: PageDto<MediaResult>): Page<Watchable> {
    const page = new Page<Watchable>(data);

    const results = data.results.map(result => {
      switch(result.media_type) {
        case "tv":
          return watchableMapper.fromTVResult(result as TVResult);
        case "movie":
          return watchableMapper.fromMovieResult(result as MovieResult);
        default:
          return null;
      }
    });

    page.results = results.filter(x => !!x);

    return page;
  }

  fromMovieResult(data: PageDto<MovieResult>): Page<Watchable> {
    const page = new Page<Watchable>(data);

    const results = data.results.map(result => {
      return watchableMapper.fromMovieResult(result);
    });

    page.results = results.filter(x => !!x);

    return page;
  }

  fromTVResult(data: PageDto<TVResult>): Page<Watchable> {
    const page = new Page<Watchable>(data);

    const results = data.results.map(result => {
      return watchableMapper.fromTVResult(result);
    });

    page.results = results.filter(x => !!x);

    return page;
  }
}

const watchablePageMapper = new WatchablePageMapper();

export { watchablePageMapper };
