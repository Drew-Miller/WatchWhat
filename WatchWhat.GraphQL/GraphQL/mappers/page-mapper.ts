import { MediaResult } from "../../Shared/tmdb";
import { Page as PageDto } from "../../Shared/tmdb/dtos";
import { MovieResult } from "../../Shared/tmdb/dtos/movie";
import { TVResult } from "../../Shared/tmdb/dtos/tv";
import { Page } from "../models/page";
import { Watchable } from "../models/watchable";

class PageMapper {
  fromMediaResult(data: PageDto<MediaResult>): Page<Watchable> {
    const page = new Page<Watchable>(data);

    const results = data.results.map(result => {
      switch(result.media_type) {
        case "tv":
          return Watchable.fromTVResult(result as TVResult);
        case "movie":
          return Watchable.fromMovieResult(result as MovieResult);
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